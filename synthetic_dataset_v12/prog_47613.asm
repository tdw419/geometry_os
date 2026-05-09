; DESCRIPTION: Creates a cyan circular shape at (200, 95) with radius 63.
; PLAN: r0=200(x), r1=95(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 95
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
