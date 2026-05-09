; DESCRIPTION: Composite: Places a purple circle of radius 44 at center (138, 162) then Creates a yellow rectangular region at (367, 61) spanning 56 by 112 pixels.
; PLAN: r0=138(x), r1=162(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=61(y), r7=56(width), r8=112(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 162
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 61
LDI r7, 56
LDI r8, 112
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
