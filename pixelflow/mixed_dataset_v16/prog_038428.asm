; DESCRIPTION: Composite: Draws a yellow line from (298, 198) to (421, 21) then Places a blue circle of radius 48 at center (297, 127) then Draws a white rectangle at (77, 87) with width 81 and height 50.
; PLAN: r0=298(x1), r1=198(y1), r2=421(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=127(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=87(y), r12=81(width), r13=50(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 198
LDI r2, 421
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 127
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 87
LDI r12, 81
LDI r13, 50
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
