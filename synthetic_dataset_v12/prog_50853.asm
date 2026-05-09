; DESCRIPTION: Renders a blue line between points (220, 223) and (261, 7).
; PLAN: r0=220(x1), r1=223(y1), r2=261(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 223
LDI r2, 261
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
