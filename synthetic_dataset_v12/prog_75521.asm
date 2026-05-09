; DESCRIPTION: Places a white line segment connecting (265, 136) to (191, 136).
; PLAN: r0=265(x1), r1=136(y1), r2=191(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 136
LDI r2, 191
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
