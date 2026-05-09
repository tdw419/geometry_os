; DESCRIPTION: Composite: Draws a purple rectangle at (106, 193) with width 93 and height 12 then Sets a single green pixel at (501, 157) then Places a purple circle of radius 48 at center (386, 117).
; PLAN: r0=106(x), r1=193(y), r2=93(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x), r6=157(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=386(x), r11=117(y), r12=48(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 193
LDI r2, 93
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 157
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 386
LDI r11, 117
LDI r12, 48
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
