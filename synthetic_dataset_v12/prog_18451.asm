; DESCRIPTION: Composite: Draws a yellow line from (291, 95) to (209, 60) then Renders a yellow box of size 65x94 starting at (261, 12) then Places a red circle of radius 12 at center (284, 229).
; PLAN: r0=291(x1), r1=95(y1), r2=209(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=12(y), r7=65(width), r8=94(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=284(x), r11=229(y), r12=12(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 95
LDI r2, 209
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 12
LDI r7, 65
LDI r8, 94
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 284
LDI r11, 229
LDI r12, 12
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
