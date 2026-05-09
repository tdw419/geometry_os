; DESCRIPTION: Renders a orange line between points (476, 206) and (476, 246).
; PLAN: r0=476(x1), r1=206(y1), r2=476(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 206
LDI r2, 476
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
