; DESCRIPTION: Places a green line segment connecting (277, 101) to (326, 4).
; PLAN: r0=277(x1), r1=101(y1), r2=326(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 101
LDI r2, 326
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
