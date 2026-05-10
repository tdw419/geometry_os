; DESCRIPTION: Places a purple line segment connecting (214, 163) to (511, 93).
; PLAN: r0=214(x1), r1=163(y1), r2=511(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 163
LDI r2, 511
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
