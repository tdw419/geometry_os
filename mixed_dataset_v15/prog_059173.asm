; DESCRIPTION: Places a white line segment connecting (14, 129) to (170, 153).
; PLAN: r0=14(x1), r1=129(y1), r2=170(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 129
LDI r2, 170
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
