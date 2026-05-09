; DESCRIPTION: Places a green line segment connecting (59, 113) to (175, 188).
; PLAN: r0=59(x1), r1=113(y1), r2=175(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 113
LDI r2, 175
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
