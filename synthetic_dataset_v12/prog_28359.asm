; DESCRIPTION: Composite: Renders a blue disk with center (355, 150) and radius 73 then Sets a single yellow pixel at (500, 82) then Draws a yellow rectangle at (304, 220) with width 18 and height 28.
; PLAN: r0=355(x), r1=150(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=500(x), r6=82(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=304(x), r11=220(y), r12=18(width), r13=28(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 150
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 500
LDI r6, 82
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 304
LDI r11, 220
LDI r12, 18
LDI r13, 28
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
