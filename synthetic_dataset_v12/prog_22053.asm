; DESCRIPTION: Composite: Draws a black circle centered at (217, 35) with radius 27 then Renders a yellow line between points (315, 41) and (434, 190) then Draws a cyan rectangle at (279, 50) with width 104 and height 41.
; PLAN: r0=217(x), r1=35(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=41(y1), r7=434(x2), r8=190(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=50(y), r12=104(width), r13=41(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 35
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 41
LDI r7, 434
LDI r8, 190
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 50
LDI r12, 104
LDI r13, 41
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
