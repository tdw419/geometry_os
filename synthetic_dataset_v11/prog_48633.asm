; DESCRIPTION: Places a cyan line segment connecting (94, 143) to (116, 160).
; PLAN: r0=94(x1), r1=143(y1), r2=116(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 143
LDI r2, 116
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
