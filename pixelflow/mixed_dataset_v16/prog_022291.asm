; DESCRIPTION: Places a black circle of radius 75 at center (182, 166).
; PLAN: r0=182(x), r1=166(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 166
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
