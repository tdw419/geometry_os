; DESCRIPTION: Places a green line segment connecting (68, 232) to (246, 239).
; PLAN: r0=68(x1), r1=232(y1), r2=246(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 232
LDI r2, 246
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
