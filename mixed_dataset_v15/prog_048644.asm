; DESCRIPTION: Places a yellow line segment connecting (485, 13) to (440, 244).
; PLAN: r0=485(x1), r1=13(y1), r2=440(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 13
LDI r2, 440
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
