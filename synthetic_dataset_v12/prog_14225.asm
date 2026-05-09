; DESCRIPTION: Composite: Places a orange 118x15 rectangle at position (53, 230) then Renders a white disk with center (71, 229) and radius 12 then Places a green dot at position (110, 123).
; PLAN: r0=53(x), r1=230(y), r2=118(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x), r6=229(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=110(x), r11=123(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 230
LDI r2, 118
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 229
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 110
LDI r11, 123
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
