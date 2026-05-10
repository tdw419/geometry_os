; DESCRIPTION: Draws a purple line from (38, 150) to (189, 132).
; PLAN: r0=38(x1), r1=150(y1), r2=189(x2), r3=132(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 150
LDI r2, 189
LDI r3, 132
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
