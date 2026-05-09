; DESCRIPTION: Renders a black line between points (292, 216) and (181, 27).
; PLAN: r0=292(x1), r1=216(y1), r2=181(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 216
LDI r2, 181
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
