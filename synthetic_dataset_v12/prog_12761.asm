; DESCRIPTION: Composite: Sets a single magenta pixel at (67, 12) then Renders a green disk with center (130, 193) and radius 29 then Renders a white box of size 101x76 starting at (139, 35).
; PLAN: r0=67(x), r1=12(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=193(y), r7=29(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x), r11=35(y), r12=101(width), r13=76(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 12
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 193
LDI r7, 29
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 35
LDI r12, 101
LDI r13, 76
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
