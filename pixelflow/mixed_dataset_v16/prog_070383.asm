; DESCRIPTION: Creates a cyan circular shape at (434, 100) with radius 42.
; PLAN: r0=434(x), r1=100(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 100
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
