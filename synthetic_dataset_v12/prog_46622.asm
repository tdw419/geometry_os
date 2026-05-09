; DESCRIPTION: Composite: Draws a red rectangle at (309, 127) with width 22 and height 14 then Renders a white disk with center (362, 92) and radius 79.
; PLAN: r0=309(x), r1=127(y), r2=22(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=92(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 309
LDI r1, 127
LDI r2, 22
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 92
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
