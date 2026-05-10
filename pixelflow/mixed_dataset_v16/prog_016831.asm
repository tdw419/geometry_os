; DESCRIPTION: Draws a purple line from (43, 9) to (173, 194).
; PLAN: r0=43(x1), r1=9(y1), r2=173(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 9
LDI r2, 173
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
