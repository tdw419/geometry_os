; DESCRIPTION: Composite: Draws a purple line from (299, 250) to (206, 135) then Places a black circle of radius 50 at center (71, 91) then Places a black 47x34 rectangle at position (435, 8).
; PLAN: r0=299(x1), r1=250(y1), r2=206(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=91(y), r7=50(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=435(x), r11=8(y), r12=47(width), r13=34(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 250
LDI r2, 206
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 91
LDI r7, 50
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 435
LDI r11, 8
LDI r12, 47
LDI r13, 34
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
