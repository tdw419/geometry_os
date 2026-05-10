; DESCRIPTION: Composite: Renders a black box of size 64x17 starting at (137, 8) then Draws a cyan circle centered at (61, 134) with radius 26 then Places a green line segment connecting (502, 104) to (158, 70).
; PLAN: r0=137(x), r1=8(y), r2=64(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=134(y), r7=26(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x1), r11=104(y1), r12=158(x2), r13=70(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 8
LDI r2, 64
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 134
LDI r7, 26
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 104
LDI r12, 158
LDI r13, 70
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
