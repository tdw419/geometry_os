; DESCRIPTION: Renders a black line between points (13, 126) and (5, 252).
; PLAN: r0=13(x1), r1=126(y1), r2=5(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 126
LDI r2, 5
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
