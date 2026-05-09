; DESCRIPTION: Composite: Renders a green line between points (215, 64) and (308, 187) then Creates a orange circular shape at (406, 95) with radius 27 then Draws a green rectangle at (415, 157) with width 86 and height 43.
; PLAN: r0=215(x1), r1=64(y1), r2=308(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=95(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x), r11=157(y), r12=86(width), r13=43(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 215
LDI r1, 64
LDI r2, 308
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 95
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 157
LDI r12, 86
LDI r13, 43
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
