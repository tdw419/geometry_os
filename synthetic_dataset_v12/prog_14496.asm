; DESCRIPTION: Places a green line segment connecting (375, 10) to (296, 208).
; PLAN: r0=375(x1), r1=10(y1), r2=296(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 10
LDI r2, 296
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
