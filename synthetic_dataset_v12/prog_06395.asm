; DESCRIPTION: Places a yellow line segment connecting (98, 171) to (255, 252).
; PLAN: r0=98(x1), r1=171(y1), r2=255(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 171
LDI r2, 255
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
