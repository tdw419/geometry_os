; DESCRIPTION: Composite: Places a magenta dot at position (341, 183) then Draws a green circle centered at (130, 65) with radius 21 then Renders a purple box of size 119x86 starting at (77, 103).
; PLAN: r0=341(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=65(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=103(y), r12=119(width), r13=86(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 65
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 103
LDI r12, 119
LDI r13, 86
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
