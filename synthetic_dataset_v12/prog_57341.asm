; DESCRIPTION: Renders a orange line between points (168, 245) and (444, 154).
; PLAN: r0=168(x1), r1=245(y1), r2=444(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 245
LDI r2, 444
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
