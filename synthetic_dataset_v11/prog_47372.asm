; DESCRIPTION: Creates a cyan circular shape at (180, 88) with radius 64.
; PLAN: r0=180(x), r1=88(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 88
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
