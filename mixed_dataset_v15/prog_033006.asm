; DESCRIPTION: Draws a green line from (491, 15) to (53, 107).
; PLAN: r0=491(x1), r1=15(y1), r2=53(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 15
LDI r2, 53
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
