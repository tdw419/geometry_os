; DESCRIPTION: Composite: Renders a white box of size 75x84 starting at (42, 122) then Places a red dot at position (12, 184) then Draws a blue line from (170, 207) to (404, 175).
; PLAN: r0=42(x), r1=122(y), r2=75(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x), r6=184(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=170(x1), r11=207(y1), r12=404(x2), r13=175(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 122
LDI r2, 75
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 184
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 170
LDI r11, 207
LDI r12, 404
LDI r13, 175
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
