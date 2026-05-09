; DESCRIPTION: Places a cyan line segment connecting (151, 232) to (190, 206).
; PLAN: r0=151(x1), r1=232(y1), r2=190(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 232
LDI r2, 190
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
