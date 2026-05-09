; DESCRIPTION: Draws a orange line from (485, 177) to (200, 223).
; PLAN: r0=485(x1), r1=177(y1), r2=200(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 177
LDI r2, 200
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
