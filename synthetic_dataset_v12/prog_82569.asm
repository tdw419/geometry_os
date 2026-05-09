; DESCRIPTION: Composite: Draws a magenta rectangle at (410, 39) with width 79 and height 35 then Renders a black disk with center (227, 127) and radius 76.
; PLAN: r0=410(x), r1=39(y), r2=79(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=127(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 410
LDI r1, 39
LDI r2, 79
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 127
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
