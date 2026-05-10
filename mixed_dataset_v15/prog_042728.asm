; DESCRIPTION: Places a green line segment connecting (440, 18) to (264, 222).
; PLAN: r0=440(x1), r1=18(y1), r2=264(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 18
LDI r2, 264
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
