; DESCRIPTION: Composite: Draws a cyan line from (368, 139) to (136, 202) then Draws a orange circle centered at (35, 38) with radius 20 then Places a yellow 39x21 rectangle at position (49, 136).
; PLAN: r0=368(x1), r1=139(y1), r2=136(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=38(y), r7=20(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x), r11=136(y), r12=39(width), r13=21(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 139
LDI r2, 136
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 38
LDI r7, 20
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 136
LDI r12, 39
LDI r13, 21
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
