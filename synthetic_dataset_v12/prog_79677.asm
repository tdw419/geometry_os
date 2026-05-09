; DESCRIPTION: Renders a orange line between points (42, 79) and (369, 142).
; PLAN: r0=42(x1), r1=79(y1), r2=369(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 79
LDI r2, 369
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
