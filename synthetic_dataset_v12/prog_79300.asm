; DESCRIPTION: Composite: Places a blue dot at position (394, 151) then Places a yellow line segment connecting (217, 230) to (135, 93) then Draws a black rectangle at (59, 84) with width 11 and height 95.
; PLAN: r0=394(x), r1=151(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=230(y1), r7=135(x2), r8=93(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=84(y), r12=11(width), r13=95(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 151
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 230
LDI r7, 135
LDI r8, 93
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 84
LDI r12, 11
LDI r13, 95
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
