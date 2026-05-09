; DESCRIPTION: Draws a purple line from (241, 105) to (152, 225).
; PLAN: r0=241(x1), r1=105(y1), r2=152(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 105
LDI r2, 152
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
