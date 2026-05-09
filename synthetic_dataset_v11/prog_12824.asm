; DESCRIPTION: Places a red line segment connecting (88, 151) to (153, 29).
; PLAN: r0=88(x1), r1=151(y1), r2=153(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 151
LDI r2, 153
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
