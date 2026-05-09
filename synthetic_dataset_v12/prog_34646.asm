; DESCRIPTION: Draws a black line from (485, 64) to (381, 70).
; PLAN: r0=485(x1), r1=64(y1), r2=381(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 64
LDI r2, 381
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
