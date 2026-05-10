; DESCRIPTION: Composite: Draws a magenta rectangle at (243, 104) with width 96 and height 44 then Renders a magenta disk with center (412, 144) and radius 18.
; PLAN: r0=243(x), r1=104(y), r2=96(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=144(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 104
LDI r2, 96
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 144
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
