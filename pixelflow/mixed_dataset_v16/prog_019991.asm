; DESCRIPTION: Composite: Renders a orange line between points (310, 62) and (28, 126) then Draws a cyan circle centered at (330, 100) with radius 28 then Renders a yellow box of size 13x41 starting at (460, 54).
; PLAN: r0=310(x1), r1=62(y1), r2=28(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=100(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=54(y), r12=13(width), r13=41(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 62
LDI r2, 28
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 100
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 54
LDI r12, 13
LDI r13, 41
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
