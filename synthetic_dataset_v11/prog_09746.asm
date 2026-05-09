; DESCRIPTION: Places a cyan line segment connecting (187, 212) to (147, 93).
; PLAN: r0=187(x1), r1=212(y1), r2=147(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 212
LDI r2, 147
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
