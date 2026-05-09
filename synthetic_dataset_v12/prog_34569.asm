; DESCRIPTION: Places a cyan line segment connecting (115, 241) to (452, 77).
; PLAN: r0=115(x1), r1=241(y1), r2=452(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 241
LDI r2, 452
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
