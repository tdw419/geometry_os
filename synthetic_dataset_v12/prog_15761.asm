; DESCRIPTION: Composite: Renders a black box of size 106x48 starting at (160, 188) then Draws a orange circle centered at (433, 161) with radius 25 then Draws a white line from (41, 114) to (396, 170).
; PLAN: r0=160(x), r1=188(y), r2=106(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=161(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x1), r11=114(y1), r12=396(x2), r13=170(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 188
LDI r2, 106
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 161
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 114
LDI r12, 396
LDI r13, 170
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
