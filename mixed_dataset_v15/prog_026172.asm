; DESCRIPTION: Composite: Places a blue circle of radius 60 at center (140, 157) then Renders a cyan box of size 45x21 starting at (384, 166) then Places a white dot at position (483, 159).
; PLAN: r0=140(x), r1=157(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=166(y), r7=45(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=483(x), r11=159(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 157
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 166
LDI r7, 45
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 159
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
