; DESCRIPTION: Composite: Places a black dot at position (220, 28) then Renders a purple disk with center (391, 196) and radius 49 then Draws a orange rectangle at (264, 23) with width 99 and height 90.
; PLAN: r0=220(x), r1=28(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=196(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=23(y), r12=99(width), r13=90(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 220
LDI r1, 28
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 391
LDI r6, 196
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 23
LDI r12, 99
LDI r13, 90
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
