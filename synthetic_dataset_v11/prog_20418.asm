; DESCRIPTION: Renders a purple line between points (165, 187) and (127, 7).
; PLAN: r0=165(x1), r1=187(y1), r2=127(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 187
LDI r2, 127
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
