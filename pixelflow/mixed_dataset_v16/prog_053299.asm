; DESCRIPTION: Places a cyan line segment connecting (47, 167) to (486, 93).
; PLAN: r0=47(x1), r1=167(y1), r2=486(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 167
LDI r2, 486
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
