; DESCRIPTION: Composite: Creates a red circular shape at (357, 94) with radius 46 then Draws a red rectangle at (353, 96) with width 10 and height 25 then Sets a single cyan pixel at (206, 230).
; PLAN: r0=357(x), r1=94(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=96(y), r7=10(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=230(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 94
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 96
LDI r7, 10
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 230
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
