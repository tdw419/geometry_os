; DESCRIPTION: Renders a black line between points (61, 14) and (68, 10).
; PLAN: r0=61(x1), r1=14(y1), r2=68(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 14
LDI r2, 68
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
