; DESCRIPTION: Places a green line segment connecting (176, 219) to (333, 30).
; PLAN: r0=176(x1), r1=219(y1), r2=333(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 219
LDI r2, 333
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
