; DESCRIPTION: Composite: Renders a cyan line between points (313, 32) and (23, 136) then Places a cyan circle of radius 41 at center (166, 93) then Draws a yellow rectangle at (128, 1) with width 109 and height 28.
; PLAN: r0=313(x1), r1=32(y1), r2=23(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=93(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x), r11=1(y), r12=109(width), r13=28(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 32
LDI r2, 23
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 93
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 1
LDI r12, 109
LDI r13, 28
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
