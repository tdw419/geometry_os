; DESCRIPTION: Renders a red line between points (330, 17) and (282, 194).
; PLAN: r0=330(x1), r1=17(y1), r2=282(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 17
LDI r2, 282
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
