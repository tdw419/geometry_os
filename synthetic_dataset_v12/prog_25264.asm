; DESCRIPTION: Composite: Places a blue circle of radius 78 at center (374, 118) then Creates a orange rectangular region at (105, 154) spanning 86 by 54 pixels.
; PLAN: r0=374(x), r1=118(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=154(y), r7=86(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 374
LDI r1, 118
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 154
LDI r7, 86
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
