; DESCRIPTION: Places a green line segment connecting (326, 181) to (353, 210).
; PLAN: r0=326(x1), r1=181(y1), r2=353(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 181
LDI r2, 353
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
