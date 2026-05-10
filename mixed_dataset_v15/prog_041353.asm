; DESCRIPTION: Composite: Places a yellow 69x18 rectangle at position (363, 195) then Renders a green disk with center (319, 130) and radius 75.
; PLAN: r0=363(x), r1=195(y), r2=69(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=130(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 363
LDI r1, 195
LDI r2, 69
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 130
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
