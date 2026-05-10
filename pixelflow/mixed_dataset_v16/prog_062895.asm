; DESCRIPTION: Composite: Renders a blue disk with center (73, 127) and radius 20 then Draws a red rectangle at (342, 94) with width 86 and height 69.
; PLAN: r0=73(x), r1=127(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=342(x), r6=94(y), r7=86(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 127
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 342
LDI r6, 94
LDI r7, 86
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
