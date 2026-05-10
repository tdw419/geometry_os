; DESCRIPTION: Places a cyan line segment connecting (133, 192) to (374, 190).
; PLAN: r0=133(x1), r1=192(y1), r2=374(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 192
LDI r2, 374
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
