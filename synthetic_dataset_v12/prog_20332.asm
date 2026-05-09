; DESCRIPTION: Places a cyan line segment connecting (325, 158) to (182, 48).
; PLAN: r0=325(x1), r1=158(y1), r2=182(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 158
LDI r2, 182
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
