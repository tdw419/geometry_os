; DESCRIPTION: Places a green line segment connecting (227, 208) to (111, 239).
; PLAN: r0=227(x1), r1=208(y1), r2=111(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 208
LDI r2, 111
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
