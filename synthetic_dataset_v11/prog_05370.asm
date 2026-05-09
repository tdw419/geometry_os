; DESCRIPTION: Renders a black line between points (27, 108) and (13, 252).
; PLAN: r0=27(x1), r1=108(y1), r2=13(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 108
LDI r2, 13
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
