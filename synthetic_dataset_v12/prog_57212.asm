; DESCRIPTION: Renders a black line between points (95, 9) and (324, 27).
; PLAN: r0=95(x1), r1=9(y1), r2=324(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 9
LDI r2, 324
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
