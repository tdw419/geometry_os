; DESCRIPTION: Renders a orange line between points (305, 114) and (457, 7).
; PLAN: r0=305(x1), r1=114(y1), r2=457(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 114
LDI r2, 457
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
