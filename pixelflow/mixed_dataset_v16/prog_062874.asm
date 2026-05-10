; DESCRIPTION: Composite: Renders a red box of size 41x35 starting at (152, 172) then Creates a black circular shape at (50, 104) with radius 40 then Sets a single orange pixel at (63, 252).
; PLAN: r0=152(x), r1=172(y), r2=41(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=104(y), r7=40(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=63(x), r11=252(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 172
LDI r2, 41
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 104
LDI r7, 40
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 63
LDI r11, 252
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
