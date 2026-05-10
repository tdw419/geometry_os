; DESCRIPTION: Composite: Creates a yellow rectangular region at (5, 177) spanning 13 by 77 pixels then Places a purple circle of radius 61 at center (270, 71).
; PLAN: r0=5(x), r1=177(y), r2=13(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=71(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 5
LDI r1, 177
LDI r2, 13
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 71
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
