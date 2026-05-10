; DESCRIPTION: Places a cyan circle of radius 66 at center (180, 141).
; PLAN: r0=180(x), r1=141(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 141
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
