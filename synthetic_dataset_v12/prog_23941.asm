; DESCRIPTION: Renders a purple line between points (261, 185) and (313, 19).
; PLAN: r0=261(x1), r1=185(y1), r2=313(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 185
LDI r2, 313
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
