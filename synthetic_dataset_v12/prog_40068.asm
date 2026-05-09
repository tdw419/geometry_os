; DESCRIPTION: Renders a blue line between points (121, 187) and (183, 66).
; PLAN: r0=121(x1), r1=187(y1), r2=183(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 187
LDI r2, 183
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
