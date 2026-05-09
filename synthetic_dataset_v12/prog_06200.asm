; DESCRIPTION: Renders a black line between points (68, 54) and (25, 153).
; PLAN: r0=68(x1), r1=54(y1), r2=25(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 54
LDI r2, 25
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
