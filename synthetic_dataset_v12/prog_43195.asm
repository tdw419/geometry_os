; DESCRIPTION: Composite: Draws a yellow circle centered at (58, 45) with radius 33 then Creates a blue rectangular region at (428, 166) spanning 47 by 38 pixels.
; PLAN: r0=58(x), r1=45(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=166(y), r7=47(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 45
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 166
LDI r7, 47
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
