; DESCRIPTION: Places a cyan line segment connecting (158, 21) to (93, 126).
; PLAN: r0=158(x1), r1=21(y1), r2=93(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 21
LDI r2, 93
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
