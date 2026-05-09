; DESCRIPTION: Places a cyan line segment connecting (282, 11) to (383, 179).
; PLAN: r0=282(x1), r1=11(y1), r2=383(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 11
LDI r2, 383
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
