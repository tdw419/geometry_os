; DESCRIPTION: Renders a blue line segment connecting (241, 176) to (261, 108).
; PLAN: r0=241(x1), r1=176(y1), r2=261(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 176
LDI r2, 261
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
