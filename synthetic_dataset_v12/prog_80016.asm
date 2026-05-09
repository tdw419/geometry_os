; DESCRIPTION: Draws a orange line from (203, 129) to (154, 153).
; PLAN: r0=203(x1), r1=129(y1), r2=154(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 129
LDI r2, 154
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
