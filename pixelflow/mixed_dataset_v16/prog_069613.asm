; DESCRIPTION: Places a cyan line segment connecting (458, 8) to (411, 156).
; PLAN: r0=458(x1), r1=8(y1), r2=411(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 8
LDI r2, 411
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
