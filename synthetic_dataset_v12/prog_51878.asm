; DESCRIPTION: Places a red line segment connecting (138, 248) to (8, 127).
; PLAN: r0=138(x1), r1=248(y1), r2=8(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 248
LDI r2, 8
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
