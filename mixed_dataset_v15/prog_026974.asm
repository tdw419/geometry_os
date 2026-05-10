; DESCRIPTION: Places a yellow line segment connecting (209, 108) to (409, 92).
; PLAN: r0=209(x1), r1=108(y1), r2=409(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 108
LDI r2, 409
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
