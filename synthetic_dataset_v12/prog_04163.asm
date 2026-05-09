; DESCRIPTION: Composite: Places a red dot at position (274, 26) then Renders a magenta box of size 62x74 starting at (80, 64) then Draws a red circle centered at (253, 50) with radius 26.
; PLAN: r0=274(x), r1=26(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=64(y), r7=62(width), r8=74(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=50(y), r12=26(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 26
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 80
LDI r6, 64
LDI r7, 62
LDI r8, 74
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 50
LDI r12, 26
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
