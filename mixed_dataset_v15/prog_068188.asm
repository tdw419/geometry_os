; DESCRIPTION: Draws a purple line from (300, 106) to (32, 166).
; PLAN: r0=300(x1), r1=106(y1), r2=32(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 106
LDI r2, 32
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
