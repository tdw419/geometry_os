; DESCRIPTION: Composite: Places a white circle of radius 53 at center (321, 86) then Draws a orange line from (220, 81) to (452, 65) then Places a blue 62x53 rectangle at position (403, 95).
; PLAN: r0=321(x), r1=86(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x1), r6=81(y1), r7=452(x2), r8=65(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=403(x), r11=95(y), r12=62(width), r13=53(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 86
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 81
LDI r7, 452
LDI r8, 65
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 403
LDI r11, 95
LDI r12, 62
LDI r13, 53
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
