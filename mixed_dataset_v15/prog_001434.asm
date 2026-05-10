; DESCRIPTION: Renders a blue line between points (197, 165) and (432, 178).
; PLAN: r0=197(x1), r1=165(y1), r2=432(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 165
LDI r2, 432
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
