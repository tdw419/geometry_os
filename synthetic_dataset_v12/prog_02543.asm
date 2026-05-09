; DESCRIPTION: Places a black line segment connecting (21, 246) to (360, 214).
; PLAN: r0=21(x1), r1=246(y1), r2=360(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 246
LDI r2, 360
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
