; DESCRIPTION: Places a green line segment connecting (391, 88) to (394, 219).
; PLAN: r0=391(x1), r1=88(y1), r2=394(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 88
LDI r2, 394
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
