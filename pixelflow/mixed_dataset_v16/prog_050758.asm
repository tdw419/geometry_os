; DESCRIPTION: Composite: Places a red dot at position (464, 208) then Draws a magenta rectangle at (51, 194) with width 31 and height 51 then Places a yellow circle of radius 44 at center (268, 172).
; PLAN: r0=464(x), r1=208(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=194(y), r7=31(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x), r11=172(y), r12=44(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 464
LDI r1, 208
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 51
LDI r6, 194
LDI r7, 31
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 172
LDI r12, 44
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
