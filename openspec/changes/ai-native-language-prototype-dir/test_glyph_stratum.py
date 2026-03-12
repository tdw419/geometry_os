#!/usr/bin/env python3
"""
Test script for GlyphStratum AI-native language implementation
"""

import json
import sys
import os


def test_stratum_enum():
    """Test Stratum enum functionality"""
    assert Stratum.Substrate.value == 0
    assert Stratum.Memory.value == 1
    assert Stratum.Logic.value == 2
    assert Stratum.Spec.value == 3
    assert Stratum.Intent.value == 4

    # Test from_value
    assert Stratum.from_value(0) == Stratum.Substrate
    assert Stratum.from_value(2) == Stratum.Logic
    assert Stratum.from_value(4) == Stratum.Intent
    assert Stratum.from_value(5) is None  # Invalid

    print("✓ Stratum enum tests passed")


def test_opcode_enum():
    """Test Opcode enum functionality"""
    assert Opcode.Alloc.value == 1
    assert Opcode.Free.value == 2
    assert Opcode.Call.value == 7
    assert Opcode.Return.value == 8
    assert Opcode.Nop.value == 0
    assert Opcode.Halt.value == 255

    # Test from_value
    assert Opcode.from_value(1) == Opcode.Alloc
    assert Opcode.from_value(7) == Opcode.Call
    assert Opcode.from_value(255) == Opcode.Halt
    assert Opcode.from_value(99) is None  # Invalid

    # Test name
    assert Opcode.Alloc.name() == "Alloc"
    assert Opcode.Return.name() == "Return"
    assert Opcode.Halt.name() == "Halt"

    print("✓ Opcode enum tests passed")


def test_glyph_metadata():
    """Test GlyphMetadata structure"""
    metadata = GlyphMetadata(
        dependencies=[1, 2, 3],
        invariants={"max_memory": 1024, "type": "buffer"},
        provenance=ProvenanceInfo(
            session_id="test_session",
            timestamp="2026-03-11T21:30:00Z",
            creator="test_agent",
            version=1,
        ),
        rationale="Test glyph for memory allocation",
    )

    assert metadata.dependencies == [1, 2, 3]
    assert metadata.invariants["max_memory"] == 1024
    assert metadata.provenance.session_id == "test_session"
    assert metadata.rationale == "Test glyph for memory allocation"

    # Test serialization
    serialized = json.dumps(metadata, default=lambda o: o.__dict__, indent=2)
    deserialized = json.loads(serialized)
    assert deserialized["dependencies"] == [1, 2, 3]

    print("✓ GlyphMetadata tests passed")


def test_enhanced_glyph_info():
    """Test EnhancedGlyphInfo functionality"""
    # Import here to avoid path issues
    sys.path.insert(
        0,
        os.path.join(
            os.path.dirname(__file__), "..", "..", "..", "..", "systems", "infinite_map_rs", "src"
        ),
    )
    from font_atlas import GlyphInfo

    # Create a basic glyph
    base_glyph = GlyphInfo(
        unicode=65,  # 'A'
        x=0,
        y=0,
        width=32,
        height=32,
        advance=0.6,
        bearing_x=0.0,
        bearing_y=0.0,
        opcode=0,
        stratum=0,
        dependencies=[],
        invariants="{}",
        provenance="",
        rationale="",
    )

    # Create enhanced glyph
    enhanced = EnhancedGlyphInfo.from_basic(base_glyph)

    assert enhanced.base.unicode == 65
    assert enhanced.stratum == Stratum.Substrate
    assert enhanced.opcode == Opcode.Nop
    assert len(enhanced.metadata.dependencies) == 0
    assert enhanced.metadata.invariants == {}
    assert enhanced.metadata.provenance.creator == "genesis"

    # Test accessor methods
    assert enhanced.opcode() == Opcode.Nop
    assert enhanced.stratum() == Stratum.Substrate
    assert enhanced.dependencies() == []
    assert enhanced.invariants() == {}
    assert enhanced.provenance().creator == "genesis"
    assert enhanced.rationale() == "System-generated glyph"

    print("✓ EnhancedGlyphInfo tests passed")


def test_glyph_registry():
    """Test GlyphRegistry functionality"""
    registry = GlyphRegistry()

    # Import here to avoid path issues
    sys.path.insert(
        0,
        os.path.join(
            os.path.dirname(__file__), "..", "..", "..", "..", "systems", "infinite_map_rs", "src"
        ),
    )
    from font_atlas import GlyphInfo

    # Create and register a few glyphs
    glyph1 = EnhancedGlyphInfo.from_basic(
        GlyphInfo(
            unicode=65,
            x=0,
            y=0,
            width=32,
            height=32,
            advance=0.6,
            bearing_x=0,
            bearing_y=0,
            opcode=1,
            stratum=1,
            dependencies=[],
            invariants="{}",
            provenance="",
            rationale="Test 1",
        )
    )

    glyph2 = EnhancedGlyphInfo.from_basic(
        GlyphInfo(
            unicode=66,
            x=32,
            y=0,
            width=32,
            height=32,
            advance=0.6,
            bearing_x=0,
            bearing_y=0,
            opcode=2,
            stratum=1,
            dependencies=[0],
            invariants="{}",
            provenance="",
            rationale="Test 2",
        )
    )

    idx1 = registry.register(glyph1)
    idx2 = registry.register(glyph2)

    assert idx1 == 0
    assert idx2 == 1
    assert registry.next_index == 2

    # Test retrieval
    retrieved = registry.get(0)
    assert retrieved is not None
    assert retrieved.base.unicode == 65
    assert retrieved.opcode() == Opcode.Alloc
    assert retrieved.stratum() == Stratum.Memory

    # Test queries
    memory_glyphs = registry.by_stratum(Stratum.Memory)
    assert len(memory_glyphs) == 2

    alloc_glyphs = registry.by_opcode(Opcode.Alloc)
    assert len(alloc_glyphs) == 1
    assert alloc_glyphs[0][1].base.unicode == 65

    dependents = registry.dependents(0)  # Who depends on glyph 0?
    assert dependents == [1]  # Only glyph 1 depends on glyph 0

    print("✓ GlyphRegistry tests passed")


def test_integration():
    """Test integration between components"""
    # Create a simple program registry
    registry = GlyphRegistry()

    # Import here to avoid path issues
    sys.path.insert(
        0,
        os.path.join(
            os.path.dirname(__file__), "..", "..", "..", "..", "systems", "infinite_map_rs", "src"
        ),
    )
    from font_atlas import GlyphInfo

    # Allocate memory stratum
    alloc1 = EnhancedGlyphInfo.from_basic(
        GlyphInfo(
            unicode=0,
            x=0,
            y=0,
            width=32,
            height=32,
            advance=0.6,
            bearing_x=0,
            bearing_y=0,
            opcode=1,
            stratum=1,  # Alloc
            dependencies=[],
            invariants='{"size": 1024, "purpose": "source"}',
            provenance='{"session": "test", "creator": "ai", "timestamp": "now"}',
            rationale="Allocate source buffer",
        )
    )

    alloc2 = EnhancedGlyphInfo.from_basic(
        GlyphInfo(
            unicode=1,
            x=32,
            y=0,
            width=32,
            height=32,
            advance=0.6,
            bearing_x=0,
            bearing_y=0,
            opcode=1,
            stratum=1,  # Alloc
            dependencies=[],
            invariants='{"size": 512, "purpose": "dest"}',
            provenance='{"session": "test", "creator": "ai", "timestamp": "now"}',
            rationale="Allocate destination buffer",
        )
    )

    # Copy operation (logic stratum)
    memcpy = EnhancedGlyphInfo.from_basic(
        GlyphInfo(
            unicode=2,
            x=0,
            y=32,
            width=32,
            height=32,
            advance=0.6,
            bearing_x=0,
            bearing_y=0,
            opcode=7,
            stratum=2,  # Call
            dependencies=[0, 1],  # Depends on both allocations
            invariants='{"function": "memcpy", "size": 512}',
            provenance='{"session": "test", "creator": "ai", "timestamp": "now"}',
            rationale="Copy 512 bytes from source to dest",
        )
    )

    # Return success (logic stratum)
    return_success = EnhancedGlyphInfo.from_basic(
        GlyphInfo(
            unicode=3,
            x=32,
            y=32,
            width=32,
            height=32,
            advance=0.6,
            bearing_x=0,
            bearing_y=0,
            opcode=8,
            stratum=2,  # Return
            dependencies=[2],  # Depends on memcpy
            invariants='{"value": 0}',
            provenance='{"session": "test", "creator": "ai", "timestamp": "now"}',
            rationale="Return success status",
        )
    )

    # Register all glyphs
    idx1 = registry.register(alloc1)
    idx2 = registry.register(alloc2)
    idx3 = registry.register(memcpy)
    idx4 = registry.register(return_success)

    assert idx1 == 0
    assert idx2 == 1
    assert idx3 == 2
    assert idx4 == 3

    # Verify dependencies
    memcpy_glyph = registry.get(2)
    assert memcpy_glyph is not None
    assert memcpy_glyph.dependencies() == [0, 1]

    return_glyph = registry.get(3)
    assert return_glyph is not None
    assert return_glyph.dependencies() == [2]

    # Verify strata
    memory_count = len(registry.by_stratum(Stratum.Memory))
    logic_count = len(registry.by_stratum(Stratum.Logic))
    assert memory_count == 2
    assert logic_count == 2

    print("✓ Integration tests passed")


if __name__ == "__main__":
    print("Running GlyphStratum tests...")
    try:
        test_stratum_enum()
        test_opcode_enum()
        test_glyph_metadata()
        test_enhanced_glyph_info()
        test_glyph_registry()
        test_integration()
        print("\n🎉 All tests passed! GlyphStratum implementation is working correctly.")
    except Exception as e:
        print(f"\n❌ Test failed: {e}")
        import traceback

        traceback.print_exc()
        exit(1)
