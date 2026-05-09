; DESCRIPTION: Renders a orange line between points (353, 250) and (362, 221).
; PLAN: r0=353(x1), r1=250(y1), r2=362(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 250
LDI r2, 362
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
