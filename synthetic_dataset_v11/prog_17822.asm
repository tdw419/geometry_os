; DESCRIPTION: Places a red line segment connecting (55, 173) to (88, 29).
; PLAN: r0=55(x1), r1=173(y1), r2=88(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 173
LDI r2, 88
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
