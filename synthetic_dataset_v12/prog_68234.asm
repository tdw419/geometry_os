; DESCRIPTION: Places a yellow line segment connecting (341, 66) to (346, 165).
; PLAN: r0=341(x1), r1=66(y1), r2=346(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 66
LDI r2, 346
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
