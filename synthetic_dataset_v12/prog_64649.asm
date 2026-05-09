; DESCRIPTION: Places a yellow line segment connecting (379, 166) to (341, 113).
; PLAN: r0=379(x1), r1=166(y1), r2=341(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 166
LDI r2, 341
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
