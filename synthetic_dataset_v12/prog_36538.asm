; DESCRIPTION: Composite: Places a cyan dot at position (145, 72) then Draws a magenta rectangle at (102, 121) with width 28 and height 109 then Places a magenta circle of radius 52 at center (315, 154).
; PLAN: r0=145(x), r1=72(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=121(y), r7=28(width), r8=109(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=154(y), r12=52(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 145
LDI r1, 72
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 121
LDI r7, 28
LDI r8, 109
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 154
LDI r12, 52
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
