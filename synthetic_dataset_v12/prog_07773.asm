; DESCRIPTION: Draws a purple line from (154, 72) to (56, 239).
; PLAN: r0=154(x1), r1=72(y1), r2=56(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 72
LDI r2, 56
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
