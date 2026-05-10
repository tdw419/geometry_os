; DESCRIPTION: Draws a blue line from (437, 17) to (203, 128).
; PLAN: r0=437(x1), r1=17(y1), r2=203(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 17
LDI r2, 203
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
