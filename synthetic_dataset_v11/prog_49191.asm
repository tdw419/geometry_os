; DESCRIPTION: Places a white line segment connecting (108, 157) to (249, 17).
; PLAN: r0=108(x1), r1=157(y1), r2=249(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 157
LDI r2, 249
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
