; DESCRIPTION: Composite: Creates a purple circular shape at (163, 131) with radius 62 then Places a magenta dot at position (130, 129) then Renders a blue box of size 108x34 starting at (78, 216).
; PLAN: r0=163(x), r1=131(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x), r6=129(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=78(x), r11=216(y), r12=108(width), r13=34(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 163
LDI r1, 131
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 129
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 78
LDI r11, 216
LDI r12, 108
LDI r13, 34
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
