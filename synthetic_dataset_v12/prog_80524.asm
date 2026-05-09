; DESCRIPTION: Renders a blue line between points (261, 161) and (290, 240).
; PLAN: r0=261(x1), r1=161(y1), r2=290(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 161
LDI r2, 290
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
