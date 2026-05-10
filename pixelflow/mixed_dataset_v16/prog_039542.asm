; DESCRIPTION: Composite: Places a white 103x82 rectangle at position (130, 95) then Draws a orange line from (266, 84) to (95, 130) then Renders a green disk with center (310, 151) and radius 72.
; PLAN: r0=130(x), r1=95(y), r2=103(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x1), r6=84(y1), r7=95(x2), r8=130(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=151(y), r12=72(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 95
LDI r2, 103
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 84
LDI r7, 95
LDI r8, 130
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 151
LDI r12, 72
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
