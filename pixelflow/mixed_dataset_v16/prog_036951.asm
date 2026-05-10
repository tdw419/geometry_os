; DESCRIPTION: Composite: Places a blue 86x23 rectangle at position (197, 90) then Places a purple dot at position (139, 84) then Places a orange circle of radius 38 at center (148, 39).
; PLAN: r0=197(x), r1=90(y), r2=86(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=84(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=148(x), r11=39(y), r12=38(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 90
LDI r2, 86
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 84
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 148
LDI r11, 39
LDI r12, 38
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
