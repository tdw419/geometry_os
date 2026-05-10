; DESCRIPTION: Places a white line segment connecting (76, 155) to (186, 198).
; PLAN: r0=76(x1), r1=155(y1), r2=186(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 155
LDI r2, 186
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
