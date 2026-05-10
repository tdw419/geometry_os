; DESCRIPTION: Composite: Places a orange line segment connecting (175, 213) to (1, 224) then Draws a cyan circle centered at (432, 160) with radius 53 then Places a orange dot at position (287, 8).
; PLAN: r0=175(x1), r1=213(y1), r2=1(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=160(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=287(x), r11=8(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 175
LDI r1, 213
LDI r2, 1
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 160
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 287
LDI r11, 8
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
