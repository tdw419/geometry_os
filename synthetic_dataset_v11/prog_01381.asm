; DESCRIPTION: Renders a yellow line between points (215, 41) and (132, 39).
; PLAN: r0=215(x1), r1=41(y1), r2=132(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 41
LDI r2, 132
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
