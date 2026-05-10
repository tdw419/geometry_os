; DESCRIPTION: Composite: Creates a blue circular shape at (21, 72) with radius 20 then Draws a red rectangle at (353, 92) with width 17 and height 70 then Sets a single magenta pixel at (303, 174).
; PLAN: r0=21(x), r1=72(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=92(y), r7=17(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=303(x), r11=174(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 21
LDI r1, 72
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 92
LDI r7, 17
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 174
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
