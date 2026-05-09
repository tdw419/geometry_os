; DESCRIPTION: Places a yellow line segment connecting (197, 252) to (197, 184).
; PLAN: r0=197(x1), r1=252(y1), r2=197(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 252
LDI r2, 197
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
