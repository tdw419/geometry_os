; DESCRIPTION: Places a white line segment connecting (328, 240) to (430, 153).
; PLAN: r0=328(x1), r1=240(y1), r2=430(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 240
LDI r2, 430
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
