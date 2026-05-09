; DESCRIPTION: Composite: Draws a magenta circle centered at (380, 125) with radius 30 then Renders a blue box of size 51x59 starting at (256, 72).
; PLAN: r0=380(x), r1=125(y), r2=30(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=72(y), r7=51(width), r8=59(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 125
LDI r2, 30
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 72
LDI r7, 51
LDI r8, 59
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
