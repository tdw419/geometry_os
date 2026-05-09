; DESCRIPTION: Places a black line segment connecting (154, 248) to (7, 246).
; PLAN: r0=154(x1), r1=248(y1), r2=7(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 248
LDI r2, 7
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
