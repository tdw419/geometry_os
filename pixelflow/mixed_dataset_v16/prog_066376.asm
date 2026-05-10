; DESCRIPTION: Renders a orange line between points (68, 8) and (259, 143).
; PLAN: r0=68(x1), r1=8(y1), r2=259(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 8
LDI r2, 259
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
