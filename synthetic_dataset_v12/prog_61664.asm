; DESCRIPTION: Composite: Sets a single blue pixel at (381, 65) then Draws a magenta rectangle at (377, 162) with width 100 and height 44 then Draws a cyan circle centered at (177, 125) with radius 51.
; PLAN: r0=381(x), r1=65(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=162(y), r7=100(width), r8=44(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=177(x), r11=125(y), r12=51(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 381
LDI r1, 65
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 162
LDI r7, 100
LDI r8, 44
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 177
LDI r11, 125
LDI r12, 51
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
