; DESCRIPTION: Renders a red line between points (16, 76) and (495, 43).
; PLAN: r0=16(x1), r1=76(y1), r2=495(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 76
LDI r2, 495
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
