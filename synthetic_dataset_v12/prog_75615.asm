; DESCRIPTION: Composite: Renders a cyan box of size 115x74 starting at (103, 31) then Sets a single green pixel at (353, 183) then Renders a blue disk with center (175, 157) and radius 11.
; PLAN: r0=103(x), r1=31(y), r2=115(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=183(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=175(x), r11=157(y), r12=11(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 31
LDI r2, 115
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 183
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 175
LDI r11, 157
LDI r12, 11
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
