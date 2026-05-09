; DESCRIPTION: Places a green line segment connecting (204, 200) to (479, 185).
; PLAN: r0=204(x1), r1=200(y1), r2=479(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 200
LDI r2, 479
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
