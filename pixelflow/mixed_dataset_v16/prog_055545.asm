; DESCRIPTION: Draws a purple line from (295, 192) to (195, 22).
; PLAN: r0=295(x1), r1=192(y1), r2=195(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 192
LDI r2, 195
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
