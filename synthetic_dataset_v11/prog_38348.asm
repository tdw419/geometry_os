; DESCRIPTION: Places a cyan circle of radius 74 at center (112, 94).
; PLAN: r0=112(x), r1=94(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 94
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
