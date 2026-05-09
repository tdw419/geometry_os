; DESCRIPTION: Composite: Draws a blue line from (18, 128) to (479, 215) then Creates a cyan circular shape at (318, 164) with radius 62 then Draws a orange rectangle at (112, 61) with width 77 and height 100.
; PLAN: r0=18(x1), r1=128(y1), r2=479(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=164(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=112(x), r11=61(y), r12=77(width), r13=100(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 128
LDI r2, 479
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 164
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 112
LDI r11, 61
LDI r12, 77
LDI r13, 100
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
