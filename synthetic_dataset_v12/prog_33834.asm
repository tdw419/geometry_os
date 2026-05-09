; DESCRIPTION: Renders a red line between points (23, 185) and (282, 36).
; PLAN: r0=23(x1), r1=185(y1), r2=282(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 185
LDI r2, 282
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
