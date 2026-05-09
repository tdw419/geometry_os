; DESCRIPTION: Composite: Draws a black line from (11, 209) to (421, 252) then Renders a purple disk with center (457, 148) and radius 39 then Places a orange 20x68 rectangle at position (243, 13).
; PLAN: r0=11(x1), r1=209(y1), r2=421(x2), r3=252(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=457(x), r6=148(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=243(x), r11=13(y), r12=20(width), r13=68(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 11
LDI r1, 209
LDI r2, 421
LDI r3, 252
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 148
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 243
LDI r11, 13
LDI r12, 20
LDI r13, 68
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
