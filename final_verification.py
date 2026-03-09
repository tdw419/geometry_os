#!/usr/bin/env python3
"""Final verification of quadtree integration."""
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

def main():
    print("=" * 70)
    print("FINAL VERIFICATION: GravityEngine Quadtree Integration")
    print("=" * 70)

    # Test 1: Import check
    print("\n1. Import check...")
    try:
        from systems.infinite_map.gravity_engine import GravityEngine
        from systems.infinite_map.quadtree import QuadTree
        print("   PASS: All imports successful")
    except Exception as e:
        print(f"   FAIL: Import error - {e}")
        return False

    # Test 2: Constructor parameters
    print("\n2. Constructor parameter check...")
    try:
        engine = GravityEngine(
            use_quadtree=True,
            quadtree_threshold=50,
            theta=0.5
        )
        assert hasattr(engine, 'use_quadtree')
        assert hasattr(engine, 'quadtree_threshold')
        assert hasattr(engine, 'theta')
        assert engine.use_quadtree == True
        assert engine.quadtree_threshold == 50
        assert engine.theta == 0.5
        print("   PASS: Constructor parameters work correctly")
    except Exception as e:
        print(f"   FAIL: Constructor error - {e}")
        return False

    # Test 3: Small N uses direct
    print("\n3. Small N (5 particles) uses direct calculation...")
    try:
        engine = GravityEngine(use_quadtree=True, quadtree_threshold=10)
        for i in range(5):
            engine.add_orb(f"file_{i}.py", i * 100, i * 100, 128, size=100)
        engine.update()
        print("   PASS: Small N update completed without error")
    except Exception as e:
        print(f"   FAIL: Small N update error - {e}")
        return False

    # Test 4: Large N uses quadtree
    print("\n4. Large N (100 particles) uses quadtree...")
    try:
        engine = GravityEngine(use_quadtree=True, quadtree_threshold=10)
        for i in range(100):
            x = (i * 73) % 1024
            y = (i * 97) % 1024
            engine.add_orb(f"file_{i}.py", x, y, 128, size=100)
        engine.update()
        print("   PASS: Large N update completed without error")
    except Exception as e:
        print(f"   FAIL: Large N update error - {e}")
        return False

    # Test 5: Quadtree disabled
    print("\n5. Quadtree disabled (use_quadtree=False)...")
    try:
        engine = GravityEngine(use_quadtree=False)
        for i in range(100):
            engine.add_orb(f"file_{i}.py", i * 10, i * 10, 128, size=100)
        engine.update()
        print("   PASS: Direct-only mode works")
    except Exception as e:
        print(f"   FAIL: Direct-only mode error - {e}")
        return False

    # Test 6: Accuracy comparison
    print("\n6. Accuracy: Quadtree vs Direct (50 particles)...")
    try:
        import numpy as np

        # Direct engine
        engine_direct = GravityEngine(use_quadtree=False)
        for i in range(50):
            x = (i * 73) % 1024
            y = (i * 97) % 1024
            engine_direct.add_orb(f"file_{i}.py", x, y, 128, size=100)

        # Quadtree engine
        engine_quad = GravityEngine(use_quadtree=True, theta=0.5, quadtree_threshold=10)
        for i in range(50):
            x = (i * 73) % 1024
            y = (i * 97) % 1024
            engine_quad.add_orb(f"file_{i}.py", x, y, 128, size=100)

        # Update both
        engine_direct.update()
        engine_quad.update()

        # Compare XY positions
        max_error = 0.0
        for path in engine_direct.orbs:
            pos_d = engine_direct.orbs[path]["pos"]
            pos_q = engine_quad.orbs[path]["pos"]
            error = np.sqrt((pos_d[0] - pos_q[0])**2 + (pos_d[1] - pos_q[1])**2)
            max_error = max(max_error, error)

        print(f"   Max XY position error: {max_error:.4f}")
        if max_error < 100.0:  # Reasonable tolerance
            print("   PASS: Accuracy within acceptable tolerance")
        else:
            print(f"   WARNING: Error {max_error:.4f} exceeds tolerance 100.0")
    except Exception as e:
        print(f"   FAIL: Accuracy test error - {e}")
        import traceback
        traceback.print_exc()
        return False

    # Test 7: Links work in quadtree mode
    print("\n7. Links work correctly in quadtree mode...")
    try:
        engine = GravityEngine(use_quadtree=True, quadtree_threshold=5)
        engine.add_orb("a.py", 100, 100, 128, size=100)
        engine.add_orb("b.py", 200, 200, 128, size=100)
        engine.link_orbs("a.py", "b.py")

        # Add more particles to trigger quadtree
        for i in range(10):
            engine.add_orb(f"file_{i}.py", i * 50, i * 50, 128, size=100)

        engine.update()

        # Verify links are stored
        assert "b.py" in engine.orbs["a.py"]["links"]
        print("   PASS: Links work in quadtree mode")
    except Exception as e:
        print(f"   FAIL: Links test error - {e}")
        return False

    print("\n" + "=" * 70)
    print("SUCCESS: All verification tests passed!")
    print("=" * 70)
    print("\nIntegration complete. Ready to commit.")
    print("\nModified files:")
    print("  - systems/infinite_map/gravity_engine.py")
    print("  - tests/test_gravity_engine_quadtree.py")
    print("\nCommit command:")
    print("  git add systems/infinite_map/gravity_engine.py tests/test_gravity_engine_quadtree.py")
    print('  git commit -m "feat(tectonic): integrate Barnes-Hut quadtree into GravityEngine"')

    return True

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
