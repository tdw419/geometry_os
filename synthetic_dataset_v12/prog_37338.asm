; DESCRIPTION: Renders a orange line between points (350, 44) and (485, 50).
; PLAN: r0=350(x1), r1=44(y1), r2=485(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 44
LDI r2, 485
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
