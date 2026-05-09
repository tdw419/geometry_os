; DESCRIPTION: Composite: Renders a orange disk with center (157, 137) and radius 31 then Places a yellow 76x41 rectangle at position (435, 141) then Draws a black line from (270, 148) to (238, 164).
; PLAN: r0=157(x), r1=137(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=141(y), r7=76(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=270(x1), r11=148(y1), r12=238(x2), r13=164(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 137
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 141
LDI r7, 76
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 148
LDI r12, 238
LDI r13, 164
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
