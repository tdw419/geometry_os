; DESCRIPTION: Composite: Places a purple circle of radius 70 at center (425, 121) then Creates a blue rectangular region at (355, 76) spanning 45 by 52 pixels.
; PLAN: r0=425(x), r1=121(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=76(y), r7=45(width), r8=52(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 121
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 76
LDI r7, 45
LDI r8, 52
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
