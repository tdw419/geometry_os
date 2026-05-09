; DESCRIPTION: Places a yellow line segment connecting (140, 12) to (479, 188).
; PLAN: r0=140(x1), r1=12(y1), r2=479(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 12
LDI r2, 479
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
