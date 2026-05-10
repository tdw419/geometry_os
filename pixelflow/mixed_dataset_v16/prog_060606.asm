; DESCRIPTION: Draws a purple line from (363, 96) to (16, 68).
; PLAN: r0=363(x1), r1=96(y1), r2=16(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 96
LDI r2, 16
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
