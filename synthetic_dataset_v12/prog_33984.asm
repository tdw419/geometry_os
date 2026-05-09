; DESCRIPTION: Renders a orange line between points (70, 143) and (69, 247).
; PLAN: r0=70(x1), r1=143(y1), r2=69(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 143
LDI r2, 69
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
