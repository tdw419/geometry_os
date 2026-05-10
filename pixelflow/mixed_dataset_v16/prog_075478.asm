; DESCRIPTION: Composite: Renders a blue disk with center (134, 160) and radius 44 then Creates a green rectangular region at (432, 117) spanning 58 by 90 pixels then Places a cyan dot at position (256, 179).
; PLAN: r0=134(x), r1=160(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=432(x), r6=117(y), r7=58(width), r8=90(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=179(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 134
LDI r1, 160
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 432
LDI r6, 117
LDI r7, 58
LDI r8, 90
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 179
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
