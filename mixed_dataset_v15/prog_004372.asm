; DESCRIPTION: Renders a orange line between points (253, 154) and (236, 10).
; PLAN: r0=253(x1), r1=154(y1), r2=236(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 154
LDI r2, 236
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
