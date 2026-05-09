; DESCRIPTION: Creates a cyan circular shape at (432, 180) with radius 14.
; PLAN: r0=432(x), r1=180(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 180
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
