; DESCRIPTION: Draws a yellow line from (350, 185) to (392, 11).
; PLAN: r0=350(x1), r1=185(y1), r2=392(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 185
LDI r2, 392
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
