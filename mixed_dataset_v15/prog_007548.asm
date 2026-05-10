; DESCRIPTION: Draws a orange line from (1, 46) to (154, 188).
; PLAN: r0=1(x1), r1=46(y1), r2=154(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 46
LDI r2, 154
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
