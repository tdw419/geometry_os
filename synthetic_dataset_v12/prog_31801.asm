; DESCRIPTION: Draws a purple line from (485, 137) to (76, 255).
; PLAN: r0=485(x1), r1=137(y1), r2=76(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 137
LDI r2, 76
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
