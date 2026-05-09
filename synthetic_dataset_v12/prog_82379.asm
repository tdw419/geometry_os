; DESCRIPTION: Places a green line segment connecting (336, 109) to (108, 21).
; PLAN: r0=336(x1), r1=109(y1), r2=108(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 109
LDI r2, 108
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
