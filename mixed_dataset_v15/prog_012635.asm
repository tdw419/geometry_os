; DESCRIPTION: Draws a orange line from (485, 48) to (108, 46).
; PLAN: r0=485(x1), r1=48(y1), r2=108(x2), r3=46(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 48
LDI r2, 108
LDI r3, 46
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
