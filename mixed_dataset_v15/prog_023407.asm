; DESCRIPTION: Renders a red line segment connecting (126, 13) to (43, 58).
; PLAN: r0=126(x1), r1=13(y1), r2=43(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 13
LDI r2, 43
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
