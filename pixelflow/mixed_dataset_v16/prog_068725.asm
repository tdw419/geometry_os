; DESCRIPTION: Composite: Places a green 35x35 rectangle at position (474, 211) then Places a green line segment connecting (200, 221) to (307, 98) then Draws a orange circle centered at (252, 135) with radius 50.
; PLAN: r0=474(x), r1=211(y), r2=35(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x1), r6=221(y1), r7=307(x2), r8=98(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=252(x), r11=135(y), r12=50(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 474
LDI r1, 211
LDI r2, 35
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 221
LDI r7, 307
LDI r8, 98
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 135
LDI r12, 50
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
