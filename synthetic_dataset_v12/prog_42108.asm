; DESCRIPTION: Places a yellow line segment connecting (398, 7) to (372, 20).
; PLAN: r0=398(x1), r1=7(y1), r2=372(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 7
LDI r2, 372
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
