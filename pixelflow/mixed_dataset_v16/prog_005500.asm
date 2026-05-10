; DESCRIPTION: Composite: Draws a yellow circle centered at (381, 60) with radius 19 then Places a cyan 46x82 rectangle at position (217, 110) then Places a purple line segment connecting (340, 254) to (34, 225).
; PLAN: r0=381(x), r1=60(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=110(y), r7=46(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x1), r11=254(y1), r12=34(x2), r13=225(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 60
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 110
LDI r7, 46
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 254
LDI r12, 34
LDI r13, 225
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
