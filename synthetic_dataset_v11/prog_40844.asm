; DESCRIPTION: Creates a cyan circular shape at (60, 58) with radius 42.
; PLAN: r0=60(x), r1=58(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 58
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
