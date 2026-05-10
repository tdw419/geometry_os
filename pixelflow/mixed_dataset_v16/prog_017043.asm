; DESCRIPTION: Renders a orange line between points (485, 223) and (493, 158).
; PLAN: r0=485(x1), r1=223(y1), r2=493(x2), r3=158(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 223
LDI r2, 493
LDI r3, 158
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
