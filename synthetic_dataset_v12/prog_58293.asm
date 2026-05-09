; DESCRIPTION: Composite: Places a red line segment connecting (35, 186) to (180, 50) then Draws a red circle centered at (435, 121) with radius 13 then Places a green 76x58 rectangle at position (388, 125).
; PLAN: r0=35(x1), r1=186(y1), r2=180(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=121(y), r7=13(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x), r11=125(y), r12=76(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 186
LDI r2, 180
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 121
LDI r7, 13
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 125
LDI r12, 76
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
