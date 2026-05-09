; DESCRIPTION: Places a cyan line segment connecting (60, 87) to (167, 188).
; PLAN: r0=60(x1), r1=87(y1), r2=167(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 87
LDI r2, 167
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
