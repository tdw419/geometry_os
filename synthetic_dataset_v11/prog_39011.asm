; DESCRIPTION: Places a yellow line segment connecting (20, 72) to (68, 246).
; PLAN: r0=20(x1), r1=72(y1), r2=68(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 72
LDI r2, 68
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
