; DESCRIPTION: Composite: Places a yellow circle of radius 13 at center (399, 220) then Creates a yellow rectangular region at (88, 73) spanning 61 by 82 pixels.
; PLAN: r0=399(x), r1=220(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x), r6=73(y), r7=61(width), r8=82(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 220
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 73
LDI r7, 61
LDI r8, 82
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
