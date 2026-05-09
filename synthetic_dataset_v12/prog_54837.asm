; DESCRIPTION: Creates a cyan circular shape at (415, 71) with radius 42.
; PLAN: r0=415(x), r1=71(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 71
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
