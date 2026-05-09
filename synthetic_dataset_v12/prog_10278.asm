; DESCRIPTION: Composite: Draws a cyan rectangle at (246, 88) with width 21 and height 76 then Renders a orange disk with center (209, 27) and radius 15 then Renders a white line between points (352, 74) and (477, 17).
; PLAN: r0=246(x), r1=88(y), r2=21(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=27(y), r7=15(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=352(x1), r11=74(y1), r12=477(x2), r13=17(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 88
LDI r2, 21
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 27
LDI r7, 15
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 352
LDI r11, 74
LDI r12, 477
LDI r13, 17
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
