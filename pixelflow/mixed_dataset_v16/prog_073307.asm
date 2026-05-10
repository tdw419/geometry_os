; DESCRIPTION: Composite: Creates a yellow circular shape at (395, 170) with radius 44 then Draws a magenta rectangle at (42, 103) with width 66 and height 115.
; PLAN: r0=395(x), r1=170(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=103(y), r7=66(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 170
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 103
LDI r7, 66
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
