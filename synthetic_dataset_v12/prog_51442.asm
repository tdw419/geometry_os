; DESCRIPTION: Places a green line segment connecting (192, 194) to (453, 48).
; PLAN: r0=192(x1), r1=194(y1), r2=453(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 194
LDI r2, 453
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
