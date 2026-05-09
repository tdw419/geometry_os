; DESCRIPTION: Places a cyan circle of radius 79 at center (167, 141).
; PLAN: r0=167(x), r1=141(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 141
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
