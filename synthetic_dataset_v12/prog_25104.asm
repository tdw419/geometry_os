; DESCRIPTION: Places a purple line segment connecting (479, 190) to (379, 127).
; PLAN: r0=479(x1), r1=190(y1), r2=379(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 190
LDI r2, 379
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
