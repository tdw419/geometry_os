; DESCRIPTION: Composite: Draws a blue line from (164, 210) to (373, 219) then Places a magenta circle of radius 66 at center (348, 121) then Draws a magenta rectangle at (399, 55) with width 51 and height 42.
; PLAN: r0=164(x1), r1=210(y1), r2=373(x2), r3=219(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=121(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x), r11=55(y), r12=51(width), r13=42(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 210
LDI r2, 373
LDI r3, 219
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 121
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 55
LDI r12, 51
LDI r13, 42
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
