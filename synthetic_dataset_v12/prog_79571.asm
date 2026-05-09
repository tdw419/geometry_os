; DESCRIPTION: Places a purple line segment connecting (359, 241) to (479, 64).
; PLAN: r0=359(x1), r1=241(y1), r2=479(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 241
LDI r2, 479
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
