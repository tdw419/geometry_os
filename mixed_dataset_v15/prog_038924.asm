; DESCRIPTION: Composite: Places a white line segment connecting (177, 245) to (416, 212) then Sets a single white pixel at (466, 255) then Draws a blue rectangle at (166, 150) with width 58 and height 40.
; PLAN: r0=177(x1), r1=245(y1), r2=416(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=255(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=166(x), r11=150(y), r12=58(width), r13=40(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 245
LDI r2, 416
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 255
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 166
LDI r11, 150
LDI r12, 58
LDI r13, 40
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
