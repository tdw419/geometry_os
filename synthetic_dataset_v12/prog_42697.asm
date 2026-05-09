; DESCRIPTION: Composite: Places a blue dot at position (59, 71) then Renders a purple box of size 104x34 starting at (332, 188) then Places a magenta circle of radius 66 at center (193, 147).
; PLAN: r0=59(x), r1=71(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=188(y), r7=104(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=193(x), r11=147(y), r12=66(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 71
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 332
LDI r6, 188
LDI r7, 104
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 147
LDI r12, 66
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
