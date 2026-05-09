; DESCRIPTION: Composite: Places a magenta dot at position (134, 18) then Renders a green disk with center (342, 79) and radius 59 then Draws a green rectangle at (154, 86) with width 100 and height 111.
; PLAN: r0=134(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=79(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=86(y), r12=100(width), r13=111(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 134
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 79
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 86
LDI r12, 100
LDI r13, 111
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
