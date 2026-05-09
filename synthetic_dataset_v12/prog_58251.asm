; DESCRIPTION: Composite: Renders a red box of size 52x32 starting at (299, 167) then Places a white dot at position (178, 19) then Places a yellow line segment connecting (369, 103) to (84, 197).
; PLAN: r0=299(x), r1=167(y), r2=52(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=19(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=369(x1), r11=103(y1), r12=84(x2), r13=197(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 299
LDI r1, 167
LDI r2, 52
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 19
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 369
LDI r11, 103
LDI r12, 84
LDI r13, 197
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
