; DESCRIPTION: Composite: Places a red 54x54 rectangle at position (409, 45) then Draws a blue line from (446, 50) to (29, 4) then Draws a red circle centered at (440, 75) with radius 68.
; PLAN: r0=409(x), r1=45(y), r2=54(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=50(y1), r7=29(x2), r8=4(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=440(x), r11=75(y), r12=68(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 45
LDI r2, 54
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 50
LDI r7, 29
LDI r8, 4
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 75
LDI r12, 68
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
