; DESCRIPTION: Composite: Places a white circle of radius 66 at center (335, 149) then Places a red line segment connecting (412, 18) to (178, 189) then Places a purple 29x60 rectangle at position (460, 128).
; PLAN: r0=335(x), r1=149(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x1), r6=18(y1), r7=178(x2), r8=189(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=460(x), r11=128(y), r12=29(width), r13=60(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 149
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 18
LDI r7, 178
LDI r8, 189
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 128
LDI r12, 29
LDI r13, 60
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
