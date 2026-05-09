; DESCRIPTION: Creates a cyan circular shape at (407, 74) with radius 51.
; PLAN: r0=407(x), r1=74(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 74
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
