; DESCRIPTION: Renders a orange line between points (176, 166) and (16, 124).
; PLAN: r0=176(x1), r1=166(y1), r2=16(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 166
LDI r2, 16
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
