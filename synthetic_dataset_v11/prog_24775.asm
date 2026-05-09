; DESCRIPTION: Renders a black line between points (106, 208) and (232, 27).
; PLAN: r0=106(x1), r1=208(y1), r2=232(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 208
LDI r2, 232
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
