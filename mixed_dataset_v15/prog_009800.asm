; DESCRIPTION: Renders a yellow line between points (505, 22) and (365, 246).
; PLAN: r0=505(x1), r1=22(y1), r2=365(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 22
LDI r2, 365
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
