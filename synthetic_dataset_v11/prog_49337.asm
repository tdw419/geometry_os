; DESCRIPTION: Places a cyan line segment connecting (190, 167) to (75, 249).
; PLAN: r0=190(x1), r1=167(y1), r2=75(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 167
LDI r2, 75
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
