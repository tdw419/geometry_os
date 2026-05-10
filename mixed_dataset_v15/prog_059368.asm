; DESCRIPTION: Composite: Places a red dot at position (275, 129) then Creates a blue circular shape at (76, 178) with radius 60 then Draws a purple rectangle at (269, 6) with width 85 and height 48.
; PLAN: r0=275(x), r1=129(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=76(x), r6=178(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=269(x), r11=6(y), r12=85(width), r13=48(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 129
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 76
LDI r6, 178
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 269
LDI r11, 6
LDI r12, 85
LDI r13, 48
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
