; DESCRIPTION: Composite: Places a red circle of radius 78 at center (84, 156) then Creates a blue rectangular region at (135, 4) spanning 93 by 59 pixels.
; PLAN: r0=84(x), r1=156(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x), r6=4(y), r7=93(width), r8=59(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 156
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 4
LDI r7, 93
LDI r8, 59
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
