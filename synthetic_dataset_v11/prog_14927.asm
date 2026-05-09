; DESCRIPTION: Renders a orange line between points (26, 48) and (74, 169).
; PLAN: r0=26(x1), r1=48(y1), r2=74(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 48
LDI r2, 74
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
