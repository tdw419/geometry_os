; DESCRIPTION: Composite: Places a magenta dot at position (154, 183) then Creates a yellow rectangular region at (486, 98) spanning 22 by 66 pixels then Places a green circle of radius 67 at center (137, 139).
; PLAN: r0=154(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=486(x), r6=98(y), r7=22(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=139(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 486
LDI r6, 98
LDI r7, 22
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 139
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
