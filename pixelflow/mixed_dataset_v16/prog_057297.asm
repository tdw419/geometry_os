; DESCRIPTION: Composite: Renders a black box of size 38x17 starting at (467, 3) then Places a magenta circle of radius 32 at center (389, 70) then Draws a red line from (248, 140) to (68, 52).
; PLAN: r0=467(x), r1=3(y), r2=38(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x), r6=70(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x1), r11=140(y1), r12=68(x2), r13=52(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 3
LDI r2, 38
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 70
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 140
LDI r12, 68
LDI r13, 52
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
