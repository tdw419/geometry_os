; DESCRIPTION: Draws a orange line from (154, 175) to (8, 36).
; PLAN: r0=154(x1), r1=175(y1), r2=8(x2), r3=36(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 175
LDI r2, 8
LDI r3, 36
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
