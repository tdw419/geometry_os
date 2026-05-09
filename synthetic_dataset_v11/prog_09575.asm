; DESCRIPTION: Places a green line segment connecting (226, 76) to (254, 37).
; PLAN: r0=226(x1), r1=76(y1), r2=254(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 76
LDI r2, 254
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
