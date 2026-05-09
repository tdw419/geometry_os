; DESCRIPTION: Places a black line segment connecting (246, 95) to (27, 56).
; PLAN: r0=246(x1), r1=95(y1), r2=27(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 95
LDI r2, 27
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
