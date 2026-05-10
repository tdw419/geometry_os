; DESCRIPTION: Draws a orange line from (243, 95) to (130, 74).
; PLAN: r0=243(x1), r1=95(y1), r2=130(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 95
LDI r2, 130
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
