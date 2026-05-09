; DESCRIPTION: Places a white line segment connecting (123, 114) to (470, 20).
; PLAN: r0=123(x1), r1=114(y1), r2=470(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 114
LDI r2, 470
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
