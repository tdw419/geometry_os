; DESCRIPTION: Composite: Renders a white disk with center (124, 42) and radius 35 then Draws a black rectangle at (237, 146) with width 21 and height 46 then Draws a green line from (91, 2) to (12, 64).
; PLAN: r0=124(x), r1=42(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=146(y), r7=21(width), r8=46(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x1), r11=2(y1), r12=12(x2), r13=64(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 42
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 146
LDI r7, 21
LDI r8, 46
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 2
LDI r12, 12
LDI r13, 64
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
