; DESCRIPTION: Places a white line segment connecting (0, 196) to (188, 15).
; PLAN: r0=0(x1), r1=196(y1), r2=188(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 196
LDI r2, 188
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
