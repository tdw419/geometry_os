; DESCRIPTION: Draws a black line from (230, 21) to (203, 222).
; PLAN: r0=230(x1), r1=21(y1), r2=203(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 21
LDI r2, 203
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
