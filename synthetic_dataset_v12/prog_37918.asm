; DESCRIPTION: Places a green line segment connecting (230, 80) to (396, 239).
; PLAN: r0=230(x1), r1=80(y1), r2=396(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 80
LDI r2, 396
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
