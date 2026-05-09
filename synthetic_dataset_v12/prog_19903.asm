; DESCRIPTION: Draws a purple line from (350, 152) to (225, 226).
; PLAN: r0=350(x1), r1=152(y1), r2=225(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 152
LDI r2, 225
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
