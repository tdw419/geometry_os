; DESCRIPTION: Composite: Renders a white box of size 70x39 starting at (167, 165) then Renders a cyan line between points (240, 11) and (421, 84) then Creates a blue circular shape at (196, 71) with radius 21.
; PLAN: r0=167(x), r1=165(y), r2=70(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=11(y1), r7=421(x2), r8=84(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=196(x), r11=71(y), r12=21(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 167
LDI r1, 165
LDI r2, 70
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 11
LDI r7, 421
LDI r8, 84
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 71
LDI r12, 21
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
