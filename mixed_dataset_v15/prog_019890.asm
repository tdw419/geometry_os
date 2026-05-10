; DESCRIPTION: Composite: Places a cyan 119x88 rectangle at position (312, 32) then Renders a magenta disk with center (276, 135) and radius 21 then Renders a purple line between points (75, 172) and (204, 241).
; PLAN: r0=312(x), r1=32(y), r2=119(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=135(y), r7=21(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x1), r11=172(y1), r12=204(x2), r13=241(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 32
LDI r2, 119
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 135
LDI r7, 21
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 172
LDI r12, 204
LDI r13, 241
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
