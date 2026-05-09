; DESCRIPTION: Composite: Draws a red line from (119, 140) to (16, 128) then Places a blue circle of radius 73 at center (256, 110) then Places a white 52x34 rectangle at position (95, 143).
; PLAN: r0=119(x1), r1=140(y1), r2=16(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=110(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=143(y), r12=52(width), r13=34(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 140
LDI r2, 16
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 110
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 143
LDI r12, 52
LDI r13, 34
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
