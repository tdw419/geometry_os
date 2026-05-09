; DESCRIPTION: Composite: Places a magenta dot at position (153, 12) then Renders a purple box of size 85x101 starting at (165, 44) then Renders a magenta disk with center (304, 241) and radius 11.
; PLAN: r0=153(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=44(y), r7=85(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=304(x), r11=241(y), r12=11(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 165
LDI r6, 44
LDI r7, 85
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 241
LDI r12, 11
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
