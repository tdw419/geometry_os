; DESCRIPTION: Composite: Renders a yellow line between points (62, 43) and (297, 67) then Renders a yellow box of size 42x32 starting at (358, 204) then Places a red circle of radius 35 at center (129, 141).
; PLAN: r0=62(x1), r1=43(y1), r2=297(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=204(y), r7=42(width), r8=32(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=129(x), r11=141(y), r12=35(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 43
LDI r2, 297
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 204
LDI r7, 42
LDI r8, 32
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 129
LDI r11, 141
LDI r12, 35
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
