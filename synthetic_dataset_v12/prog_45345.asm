; DESCRIPTION: Places a yellow line segment connecting (142, 132) to (487, 248).
; PLAN: r0=142(x1), r1=132(y1), r2=487(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 132
LDI r2, 487
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
