; DESCRIPTION: Draws a red line from (130, 55) to (253, 72).
; PLAN: r0=130(x1), r1=55(y1), r2=253(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 55
LDI r2, 253
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
