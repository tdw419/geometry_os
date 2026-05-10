; DESCRIPTION: Composite: Creates a red rectangular region at (310, 135) spanning 114 by 25 pixels then Creates a yellow circular shape at (234, 167) with radius 63 then Places a cyan line segment connecting (479, 183) to (121, 225).
; PLAN: r0=310(x), r1=135(y), r2=114(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=167(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x1), r11=183(y1), r12=121(x2), r13=225(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 310
LDI r1, 135
LDI r2, 114
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 167
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 183
LDI r12, 121
LDI r13, 225
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
