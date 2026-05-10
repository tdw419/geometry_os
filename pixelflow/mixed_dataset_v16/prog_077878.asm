; DESCRIPTION: Places a red circle of radius 19 at center (261, 132).
; PLAN: r0=261(x), r1=132(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 132
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
