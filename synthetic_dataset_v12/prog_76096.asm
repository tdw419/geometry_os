; DESCRIPTION: Composite: Places a yellow circle of radius 62 at center (69, 80) then Creates a white rectangular region at (370, 94) spanning 82 by 118 pixels.
; PLAN: r0=69(x), r1=80(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x), r6=94(y), r7=82(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 69
LDI r1, 80
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 94
LDI r7, 82
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
