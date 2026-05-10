; DESCRIPTION: Composite: Places a blue line segment connecting (165, 230) to (259, 62) then Sets a single red pixel at (472, 5) then Renders a green box of size 98x116 starting at (255, 82).
; PLAN: r0=165(x1), r1=230(y1), r2=259(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=472(x), r6=5(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=255(x), r11=82(y), r12=98(width), r13=116(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 230
LDI r2, 259
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 5
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 255
LDI r11, 82
LDI r12, 98
LDI r13, 116
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
