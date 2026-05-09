; DESCRIPTION: Composite: Creates a red rectangular region at (422, 86) spanning 55 by 74 pixels then Draws a red circle centered at (294, 119) with radius 54.
; PLAN: r0=422(x), r1=86(y), r2=55(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=119(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 86
LDI r2, 55
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 119
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
