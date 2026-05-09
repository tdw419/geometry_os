; DESCRIPTION: Composite: Places a magenta dot at position (458, 186) then Draws a magenta circle centered at (377, 62) with radius 59 then Draws a blue rectangle at (296, 88) with width 120 and height 109.
; PLAN: r0=458(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=62(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=88(y), r12=120(width), r13=109(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 186
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 62
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 88
LDI r12, 120
LDI r13, 109
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
