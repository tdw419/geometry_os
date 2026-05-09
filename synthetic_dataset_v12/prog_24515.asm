; DESCRIPTION: Composite: Renders a cyan disk with center (194, 103) and radius 23 then Draws a magenta rectangle at (1, 155) with width 92 and height 19.
; PLAN: r0=194(x), r1=103(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=1(x), r6=155(y), r7=92(width), r8=19(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 103
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 1
LDI r6, 155
LDI r7, 92
LDI r8, 19
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
