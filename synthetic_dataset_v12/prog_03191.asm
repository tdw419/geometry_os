; DESCRIPTION: Composite: Draws a orange line from (477, 157) to (458, 134) then Renders a green disk with center (164, 144) and radius 78 then Renders a yellow box of size 39x50 starting at (263, 37).
; PLAN: r0=477(x1), r1=157(y1), r2=458(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=144(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=263(x), r11=37(y), r12=39(width), r13=50(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 477
LDI r1, 157
LDI r2, 458
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 144
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 263
LDI r11, 37
LDI r12, 39
LDI r13, 50
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
