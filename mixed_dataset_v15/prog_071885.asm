; DESCRIPTION: Composite: Places a green circle of radius 70 at center (256, 127) then Creates a blue rectangular region at (376, 15) spanning 49 by 66 pixels.
; PLAN: r0=256(x), r1=127(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=15(y), r7=49(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 127
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 15
LDI r7, 49
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
