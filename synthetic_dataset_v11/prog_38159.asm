; DESCRIPTION: Places a yellow line segment connecting (165, 26) to (223, 142).
; PLAN: r0=165(x1), r1=26(y1), r2=223(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 26
LDI r2, 223
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
