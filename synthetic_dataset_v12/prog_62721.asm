; DESCRIPTION: Places a green line segment connecting (475, 239) to (302, 67).
; PLAN: r0=475(x1), r1=239(y1), r2=302(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 239
LDI r2, 302
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
