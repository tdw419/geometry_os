; DESCRIPTION: Draws a blue line from (485, 191) to (337, 162).
; PLAN: r0=485(x1), r1=191(y1), r2=337(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 191
LDI r2, 337
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
