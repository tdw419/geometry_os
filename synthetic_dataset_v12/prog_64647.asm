; DESCRIPTION: Composite: Draws a purple line from (86, 1) to (281, 146) then Places a purple circle of radius 35 at center (330, 104) then Places a cyan 55x55 rectangle at position (217, 28).
; PLAN: r0=86(x1), r1=1(y1), r2=281(x2), r3=146(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=104(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=28(y), r12=55(width), r13=55(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 1
LDI r2, 281
LDI r3, 146
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 104
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 28
LDI r12, 55
LDI r13, 55
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
