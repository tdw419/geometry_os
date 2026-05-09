; DESCRIPTION: Places a red line segment connecting (6, 138) to (207, 206).
; PLAN: r0=6(x1), r1=138(y1), r2=207(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 138
LDI r2, 207
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
