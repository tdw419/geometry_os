; DESCRIPTION: Places a yellow line segment connecting (470, 21) to (181, 225).
; PLAN: r0=470(x1), r1=21(y1), r2=181(x2), r3=225(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 21
LDI r2, 181
LDI r3, 225
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
