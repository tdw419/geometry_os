; DESCRIPTION: Composite: Sets a single green pixel at (457, 188) then Draws a blue circle centered at (238, 139) with radius 68 then Renders a black box of size 106x70 starting at (353, 83).
; PLAN: r0=457(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=139(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x), r11=83(y), r12=106(width), r13=70(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 238
LDI r6, 139
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 83
LDI r12, 106
LDI r13, 70
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
