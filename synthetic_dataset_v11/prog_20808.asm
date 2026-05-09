; DESCRIPTION: Renders a black line between points (41, 35) and (23, 209).
; PLAN: r0=41(x1), r1=35(y1), r2=23(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 35
LDI r2, 23
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
