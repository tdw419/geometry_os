; DESCRIPTION: Draws a orange line from (401, 46) to (369, 37).
; PLAN: r0=401(x1), r1=46(y1), r2=369(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 46
LDI r2, 369
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
