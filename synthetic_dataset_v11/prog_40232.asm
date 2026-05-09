; DESCRIPTION: Renders a red line between points (181, 153) and (72, 163).
; PLAN: r0=181(x1), r1=153(y1), r2=72(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 153
LDI r2, 72
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
