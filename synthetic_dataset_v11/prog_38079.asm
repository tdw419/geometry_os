; DESCRIPTION: Draws a purple line from (173, 123) to (2, 5).
; PLAN: r0=173(x1), r1=123(y1), r2=2(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 123
LDI r2, 2
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
