; DESCRIPTION: Composite: Places a red line segment connecting (479, 51) to (421, 128) then Renders a green disk with center (196, 76) and radius 75 then Creates a black rectangular region at (368, 142) spanning 81 by 19 pixels.
; PLAN: r0=479(x1), r1=51(y1), r2=421(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=76(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=368(x), r11=142(y), r12=81(width), r13=19(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 479
LDI r1, 51
LDI r2, 421
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 76
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 368
LDI r11, 142
LDI r12, 81
LDI r13, 19
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
