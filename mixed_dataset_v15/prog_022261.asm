; DESCRIPTION: Composite: Renders a magenta box of size 100x20 starting at (264, 144) then Places a yellow dot at position (408, 251) then Renders a white disk with center (417, 72) and radius 72.
; PLAN: r0=264(x), r1=144(y), r2=100(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=251(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=417(x), r11=72(y), r12=72(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 144
LDI r2, 100
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 251
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 417
LDI r11, 72
LDI r12, 72
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
