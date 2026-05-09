; DESCRIPTION: Places a yellow line segment connecting (336, 80) to (280, 184).
; PLAN: r0=336(x1), r1=80(y1), r2=280(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 80
LDI r2, 280
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
