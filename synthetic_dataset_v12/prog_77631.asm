; DESCRIPTION: Renders a red line between points (136, 239) and (10, 58).
; PLAN: r0=136(x1), r1=239(y1), r2=10(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 239
LDI r2, 10
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
