; DESCRIPTION: Composite: Renders a magenta disk with center (119, 161) and radius 67 then Places a yellow dot at position (55, 23) then Places a black 120x14 rectangle at position (300, 164).
; PLAN: r0=119(x), r1=161(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=23(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=300(x), r11=164(y), r12=120(width), r13=14(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 161
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 23
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 300
LDI r11, 164
LDI r12, 120
LDI r13, 14
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
