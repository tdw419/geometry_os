; DESCRIPTION: Composite: Draws a magenta rectangle at (356, 168) with width 46 and height 58 then Places a blue circle of radius 66 at center (368, 163).
; PLAN: r0=356(x), r1=168(y), r2=46(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=163(y), r7=66(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 168
LDI r2, 46
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 163
LDI r7, 66
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
