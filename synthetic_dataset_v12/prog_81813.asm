; DESCRIPTION: Renders a red line between points (492, 28) and (463, 172).
; PLAN: r0=492(x1), r1=28(y1), r2=463(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 28
LDI r2, 463
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
