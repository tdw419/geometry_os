; DESCRIPTION: Places a yellow line segment connecting (30, 103) to (274, 143).
; PLAN: r0=30(x1), r1=103(y1), r2=274(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 103
LDI r2, 274
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
