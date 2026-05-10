; DESCRIPTION: Places a black line segment connecting (413, 246) to (300, 226).
; PLAN: r0=413(x1), r1=246(y1), r2=300(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 246
LDI r2, 300
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
