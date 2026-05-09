; DESCRIPTION: Renders a black line between points (131, 205) and (41, 40).
; PLAN: r0=131(x1), r1=205(y1), r2=41(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 205
LDI r2, 41
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
