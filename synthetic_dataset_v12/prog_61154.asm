; DESCRIPTION: Composite: Places a yellow dot at position (93, 205) then Creates a yellow circular shape at (450, 67) with radius 11 then Renders a blue box of size 48x72 starting at (359, 155).
; PLAN: r0=93(x), r1=205(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=67(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=359(x), r11=155(y), r12=48(width), r13=72(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 205
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 450
LDI r6, 67
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 359
LDI r11, 155
LDI r12, 48
LDI r13, 72
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
