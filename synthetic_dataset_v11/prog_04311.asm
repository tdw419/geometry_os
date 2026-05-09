; DESCRIPTION: Renders a black line between points (110, 138) and (75, 67).
; PLAN: r0=110(x1), r1=138(y1), r2=75(x2), r3=67(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 138
LDI r2, 75
LDI r3, 67
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
