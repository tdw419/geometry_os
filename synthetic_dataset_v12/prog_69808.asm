; DESCRIPTION: Places a cyan line segment connecting (184, 47) to (323, 66).
; PLAN: r0=184(x1), r1=47(y1), r2=323(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 47
LDI r2, 323
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
