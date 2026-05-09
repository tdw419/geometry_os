; DESCRIPTION: Places a yellow line segment connecting (325, 196) to (57, 221).
; PLAN: r0=325(x1), r1=196(y1), r2=57(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 196
LDI r2, 57
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
