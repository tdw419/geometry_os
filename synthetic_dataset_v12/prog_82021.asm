; DESCRIPTION: Draws a magenta line from (374, 123) to (417, 70).
; PLAN: r0=374(x1), r1=123(y1), r2=417(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 123
LDI r2, 417
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
