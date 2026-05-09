; DESCRIPTION: Draws a purple line from (425, 150) to (371, 10).
; PLAN: r0=425(x1), r1=150(y1), r2=371(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 150
LDI r2, 371
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
