; DESCRIPTION: Draws a purple line from (205, 108) to (152, 132).
; PLAN: r0=205(x1), r1=108(y1), r2=152(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 108
LDI r2, 152
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
