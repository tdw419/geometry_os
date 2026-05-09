; DESCRIPTION: Draws a yellow line from (132, 30) to (150, 45).
; PLAN: r0=132(x1), r1=30(y1), r2=150(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 30
LDI r2, 150
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
