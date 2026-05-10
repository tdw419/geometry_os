; DESCRIPTION: Composite: Sets a single cyan pixel at (333, 115) then Places a orange circle of radius 54 at center (187, 185) then Draws a cyan rectangle at (374, 19) with width 45 and height 36.
; PLAN: r0=333(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=185(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=19(y), r12=45(width), r13=36(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 333
LDI r1, 115
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 185
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 19
LDI r12, 45
LDI r13, 36
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
