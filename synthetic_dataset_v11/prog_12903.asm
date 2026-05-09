; DESCRIPTION: Places a green line segment connecting (144, 8) to (253, 190).
; PLAN: r0=144(x1), r1=8(y1), r2=253(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 8
LDI r2, 253
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
