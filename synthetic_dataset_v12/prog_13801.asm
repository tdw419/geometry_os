; DESCRIPTION: Places a yellow line segment connecting (411, 9) to (470, 135).
; PLAN: r0=411(x1), r1=9(y1), r2=470(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 9
LDI r2, 470
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
