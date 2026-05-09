; DESCRIPTION: Draws a yellow line from (485, 1) to (77, 231).
; PLAN: r0=485(x1), r1=1(y1), r2=77(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 1
LDI r2, 77
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
