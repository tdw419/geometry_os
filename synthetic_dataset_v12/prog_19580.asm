; DESCRIPTION: Places a green line segment connecting (299, 230) to (489, 198).
; PLAN: r0=299(x1), r1=230(y1), r2=489(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 230
LDI r2, 489
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
