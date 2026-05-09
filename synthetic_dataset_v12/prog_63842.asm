; DESCRIPTION: Renders a red line between points (444, 200) and (455, 173).
; PLAN: r0=444(x1), r1=200(y1), r2=455(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 200
LDI r2, 455
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
