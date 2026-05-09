; DESCRIPTION: Renders a orange line between points (193, 143) and (154, 211).
; PLAN: r0=193(x1), r1=143(y1), r2=154(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 143
LDI r2, 154
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
