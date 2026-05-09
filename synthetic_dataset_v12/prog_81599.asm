; DESCRIPTION: Places a green line segment connecting (285, 40) to (296, 16).
; PLAN: r0=285(x1), r1=40(y1), r2=296(x2), r3=16(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 40
LDI r2, 296
LDI r3, 16
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
