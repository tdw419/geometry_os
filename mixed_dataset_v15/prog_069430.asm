; DESCRIPTION: Composite: Draws a white line from (172, 165) to (9, 64) then Places a green 20x111 rectangle at position (264, 92) then Renders a yellow disk with center (256, 195) and radius 41.
; PLAN: r0=172(x1), r1=165(y1), r2=9(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=92(y), r7=20(width), r8=111(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=256(x), r11=195(y), r12=41(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 165
LDI r2, 9
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 92
LDI r7, 20
LDI r8, 111
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 195
LDI r12, 41
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
