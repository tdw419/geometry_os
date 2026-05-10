; DESCRIPTION: Composite: Draws a orange circle centered at (333, 196) with radius 50 then Renders a magenta box of size 58x107 starting at (388, 105).
; PLAN: r0=333(x), r1=196(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x), r6=105(y), r7=58(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 196
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 105
LDI r7, 58
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
