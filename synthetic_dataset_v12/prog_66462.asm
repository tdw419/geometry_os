; DESCRIPTION: Places a green line segment connecting (338, 176) to (38, 150).
; PLAN: r0=338(x1), r1=176(y1), r2=38(x2), r3=150(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 176
LDI r2, 38
LDI r3, 150
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
