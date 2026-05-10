; DESCRIPTION: Composite: Sets a single blue pixel at (302, 129) then Places a blue circle of radius 29 at center (46, 207) then Renders a orange box of size 48x76 starting at (453, 43).
; PLAN: r0=302(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=46(x), r6=207(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=453(x), r11=43(y), r12=48(width), r13=76(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 129
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 207
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 453
LDI r11, 43
LDI r12, 48
LDI r13, 76
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
