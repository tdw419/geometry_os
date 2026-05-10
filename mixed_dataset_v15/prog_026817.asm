; DESCRIPTION: Composite: Draws a blue circle centered at (308, 50) with radius 29 then Renders a magenta box of size 120x37 starting at (234, 127).
; PLAN: r0=308(x), r1=50(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=234(x), r6=127(y), r7=120(width), r8=37(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 50
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 234
LDI r6, 127
LDI r7, 120
LDI r8, 37
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
