; DESCRIPTION: Composite: Draws a magenta rectangle at (398, 198) with width 49 and height 38 then Creates a red circular shape at (177, 82) with radius 46 then Draws a cyan line from (172, 34) to (384, 188).
; PLAN: r0=398(x), r1=198(y), r2=49(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=82(y), r7=46(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x1), r11=34(y1), r12=384(x2), r13=188(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 398
LDI r1, 198
LDI r2, 49
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 82
LDI r7, 46
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 34
LDI r12, 384
LDI r13, 188
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
