; DESCRIPTION: Renders a red line between points (340, 114) and (29, 15).
; PLAN: r0=340(x1), r1=114(y1), r2=29(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 114
LDI r2, 29
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
