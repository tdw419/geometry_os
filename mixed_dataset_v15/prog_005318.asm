; DESCRIPTION: Creates a cyan circular shape at (224, 69) with radius 42.
; PLAN: r0=224(x), r1=69(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 69
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
