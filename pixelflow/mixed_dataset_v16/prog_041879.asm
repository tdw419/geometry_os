; DESCRIPTION: Composite: Renders a white box of size 48x45 starting at (446, 159) then Sets a single yellow pixel at (192, 50) then Places a black circle of radius 19 at center (72, 197).
; PLAN: r0=446(x), r1=159(y), r2=48(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=50(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=72(x), r11=197(y), r12=19(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 446
LDI r1, 159
LDI r2, 48
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 50
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 72
LDI r11, 197
LDI r12, 19
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
