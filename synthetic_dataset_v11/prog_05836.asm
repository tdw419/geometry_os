; DESCRIPTION: Draws a blue line from (203, 30) to (173, 173).
; PLAN: r0=203(x1), r1=30(y1), r2=173(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 30
LDI r2, 173
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
