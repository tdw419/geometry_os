; DESCRIPTION: Draws a purple line from (450, 21) to (300, 128).
; PLAN: r0=450(x1), r1=21(y1), r2=300(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 21
LDI r2, 300
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
