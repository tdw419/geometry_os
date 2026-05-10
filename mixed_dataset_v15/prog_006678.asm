; DESCRIPTION: Composite: Renders a yellow disk with center (255, 203) and radius 29 then Draws a green line from (262, 17) to (265, 20) then Draws a white rectangle at (213, 177) with width 102 and height 33.
; PLAN: r0=255(x), r1=203(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x1), r6=17(y1), r7=265(x2), r8=20(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=213(x), r11=177(y), r12=102(width), r13=33(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 203
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 17
LDI r7, 265
LDI r8, 20
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 177
LDI r12, 102
LDI r13, 33
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
