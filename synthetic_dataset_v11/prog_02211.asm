; DESCRIPTION: Renders a orange line between points (154, 211) and (205, 178).
; PLAN: r0=154(x1), r1=211(y1), r2=205(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 211
LDI r2, 205
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
