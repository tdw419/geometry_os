; DESCRIPTION: Places a yellow line segment connecting (398, 238) to (353, 249).
; PLAN: r0=398(x1), r1=238(y1), r2=353(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 238
LDI r2, 353
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
