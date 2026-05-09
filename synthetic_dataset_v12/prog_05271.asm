; DESCRIPTION: Places a cyan line segment connecting (285, 172) to (452, 1).
; PLAN: r0=285(x1), r1=172(y1), r2=452(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 172
LDI r2, 452
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
