; DESCRIPTION: Composite: Renders a yellow disk with center (195, 178) and radius 45 then Places a black 90x70 rectangle at position (391, 43).
; PLAN: r0=195(x), r1=178(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=43(y), r7=90(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 178
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 43
LDI r7, 90
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
