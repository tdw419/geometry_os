; DESCRIPTION: Places a yellow line segment connecting (375, 221) to (470, 217).
; PLAN: r0=375(x1), r1=221(y1), r2=470(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 221
LDI r2, 470
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
