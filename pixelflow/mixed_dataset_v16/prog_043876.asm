; DESCRIPTION: Composite: Draws a white rectangle at (23, 151) with width 68 and height 46 then Renders a magenta disk with center (63, 39) and radius 36.
; PLAN: r0=23(x), r1=151(y), r2=68(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=39(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 23
LDI r1, 151
LDI r2, 68
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 39
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
