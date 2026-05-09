; DESCRIPTION: Places a blue line segment connecting (20, 196) to (330, 52).
; PLAN: r0=20(x1), r1=196(y1), r2=330(x2), r3=52(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 196
LDI r2, 330
LDI r3, 52
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
