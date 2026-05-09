; DESCRIPTION: Draws a purple line from (288, 60) to (281, 96).
; PLAN: r0=288(x1), r1=60(y1), r2=281(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 60
LDI r2, 281
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
