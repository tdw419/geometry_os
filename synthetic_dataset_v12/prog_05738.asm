; DESCRIPTION: Composite: Draws a blue line from (340, 61) to (118, 240) then Draws a yellow circle centered at (281, 86) with radius 72 then Places a red 42x104 rectangle at position (277, 28).
; PLAN: r0=340(x1), r1=61(y1), r2=118(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=86(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=277(x), r11=28(y), r12=42(width), r13=104(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 61
LDI r2, 118
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 86
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 277
LDI r11, 28
LDI r12, 42
LDI r13, 104
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
