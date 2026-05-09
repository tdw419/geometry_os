; DESCRIPTION: Places a yellow line segment connecting (453, 206) to (160, 31).
; PLAN: r0=453(x1), r1=206(y1), r2=160(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 206
LDI r2, 160
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
