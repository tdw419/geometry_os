; DESCRIPTION: Places a purple circle of radius 74 at center (362, 83).
; PLAN: r0=362(x), r1=83(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 83
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
