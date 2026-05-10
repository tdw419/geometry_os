; DESCRIPTION: Composite: Places a blue dot at position (309, 59) then Renders a yellow box of size 43x32 starting at (67, 131) then Renders a orange disk with center (17, 14) and radius 11.
; PLAN: r0=309(x), r1=59(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=131(y), r7=43(width), r8=32(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=17(x), r11=14(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 59
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 131
LDI r7, 43
LDI r8, 32
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 17
LDI r11, 14
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
