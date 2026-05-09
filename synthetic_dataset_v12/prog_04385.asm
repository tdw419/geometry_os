; DESCRIPTION: Places a yellow line segment connecting (400, 196) to (281, 239).
; PLAN: r0=400(x1), r1=196(y1), r2=281(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 196
LDI r2, 281
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
