; DESCRIPTION: Composite: Places a purple dot at position (509, 36) then Places a orange line segment connecting (240, 167) to (94, 224) then Renders a cyan disk with center (277, 97) and radius 41.
; PLAN: r0=509(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=240(x1), r6=167(y1), r7=94(x2), r8=224(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=277(x), r11=97(y), r12=41(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 509
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 240
LDI r6, 167
LDI r7, 94
LDI r8, 224
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 277
LDI r11, 97
LDI r12, 41
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
