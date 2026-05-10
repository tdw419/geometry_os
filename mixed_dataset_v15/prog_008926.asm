; DESCRIPTION: Composite: Draws a black circle centered at (207, 177) with radius 43 then Creates a magenta rectangular region at (169, 89) spanning 107 by 26 pixels.
; PLAN: r0=207(x), r1=177(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=169(x), r6=89(y), r7=107(width), r8=26(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 207
LDI r1, 177
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 169
LDI r6, 89
LDI r7, 107
LDI r8, 26
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
