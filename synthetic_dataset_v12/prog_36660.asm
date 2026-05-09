; DESCRIPTION: Composite: Renders a magenta disk with center (389, 184) and radius 52 then Places a cyan dot at position (353, 86) then Renders a white box of size 65x39 starting at (86, 144).
; PLAN: r0=389(x), r1=184(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=86(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=144(y), r12=65(width), r13=39(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 184
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 86
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 86
LDI r11, 144
LDI r12, 65
LDI r13, 39
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
