; DESCRIPTION: Composite: Renders a magenta box of size 54x104 starting at (143, 150) then Places a white dot at position (137, 107) then Draws a green circle centered at (426, 113) with radius 71.
; PLAN: r0=143(x), r1=150(y), r2=54(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=107(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=426(x), r11=113(y), r12=71(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 143
LDI r1, 150
LDI r2, 54
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 107
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 426
LDI r11, 113
LDI r12, 71
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
