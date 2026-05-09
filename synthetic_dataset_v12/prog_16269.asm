; DESCRIPTION: Draws a blue line from (203, 56) to (262, 15).
; PLAN: r0=203(x1), r1=56(y1), r2=262(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 56
LDI r2, 262
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
