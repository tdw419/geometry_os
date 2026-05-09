; DESCRIPTION: Creates a cyan circular shape at (180, 77) with radius 14.
; PLAN: r0=180(x), r1=77(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 77
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
