; DESCRIPTION: Places a cyan line segment connecting (190, 159) to (157, 45).
; PLAN: r0=190(x1), r1=159(y1), r2=157(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 159
LDI r2, 157
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
