; DESCRIPTION: Places a red line segment connecting (35, 175) to (118, 209).
; PLAN: r0=35(x1), r1=175(y1), r2=118(x2), r3=209(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 175
LDI r2, 118
LDI r3, 209
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
