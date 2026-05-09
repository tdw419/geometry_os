; DESCRIPTION: Places a white line segment connecting (206, 196) to (8, 232).
; PLAN: r0=206(x1), r1=196(y1), r2=8(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 196
LDI r2, 8
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
