; DESCRIPTION: Composite: Places a magenta dot at position (448, 234) then Places a yellow 87x34 rectangle at position (114, 177) then Draws a yellow circle centered at (241, 53) with radius 45.
; PLAN: r0=448(x), r1=234(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=114(x), r6=177(y), r7=87(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=53(y), r12=45(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 448
LDI r1, 234
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 177
LDI r7, 87
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 53
LDI r12, 45
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
