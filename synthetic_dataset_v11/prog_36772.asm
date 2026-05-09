; DESCRIPTION: Renders a black line between points (228, 41) and (84, 160).
; PLAN: r0=228(x1), r1=41(y1), r2=84(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 41
LDI r2, 84
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
