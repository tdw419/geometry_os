; DESCRIPTION: Composite: . Then Renders a yellow line between points (182, 86) and (148, 224). Then Creates a white circular shape at (194, 175) with radius 59.
; PLAN: r0=182(x1), r1=86(y1), r2=148(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=194(x), r1=175(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow line between points (182, 86) and (148, 224).
; PLAN: r0=182(x1), r1=86(y1), r2=148(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 86
LDI r2, 148
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (194, 175) with radius 59.
; PLAN: r0=194(x), r1=175(y), r2=59(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 175
LDI r2, 59
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
