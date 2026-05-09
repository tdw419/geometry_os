; DESCRIPTION: Places a white line segment connecting (468, 74) to (511, 153).
; PLAN: r0=468(x1), r1=74(y1), r2=511(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 74
LDI r2, 511
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
