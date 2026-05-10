; DESCRIPTION: Composite: Renders a black box of size 82x26 starting at (345, 230) then Draws a magenta circle centered at (439, 153) with radius 17 then Places a white line segment connecting (509, 109) to (456, 106).
; PLAN: r0=345(x), r1=230(y), r2=82(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=153(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x1), r11=109(y1), r12=456(x2), r13=106(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 230
LDI r2, 82
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 153
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 109
LDI r12, 456
LDI r13, 106
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
