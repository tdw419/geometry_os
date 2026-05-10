; DESCRIPTION: Composite: Draws a black rectangle at (284, 8) with width 43 and height 111 then Renders a yellow disk with center (253, 104) and radius 71 then Draws a white line from (487, 82) to (309, 185).
; PLAN: r0=284(x), r1=8(y), r2=43(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=104(y), r7=71(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=487(x1), r11=82(y1), r12=309(x2), r13=185(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 8
LDI r2, 43
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 104
LDI r7, 71
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 487
LDI r11, 82
LDI r12, 309
LDI r13, 185
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
