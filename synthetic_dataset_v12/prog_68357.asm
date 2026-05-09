; DESCRIPTION: Draws a magenta line from (350, 185) to (72, 48).
; PLAN: r0=350(x1), r1=185(y1), r2=72(x2), r3=48(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 185
LDI r2, 72
LDI r3, 48
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
