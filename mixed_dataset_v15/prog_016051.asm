; DESCRIPTION: Renders a yellow line between points (444, 91) and (488, 36).
; PLAN: r0=444(x1), r1=91(y1), r2=488(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 91
LDI r2, 488
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
