; DESCRIPTION: Composite: . Then Creates a black circular shape at (148, 90) with radius 39. Then Places a yellow line segment connecting (177, 103) to (99, 96).
; PLAN: r0=148(x), r1=90(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=177(x1), r1=103(y1), r2=99(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (148, 90) with radius 39.
; PLAN: r0=148(x), r1=90(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 90
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (177, 103) to (99, 96).
; PLAN: r0=177(x1), r1=103(y1), r2=99(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 103
LDI r2, 99
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
