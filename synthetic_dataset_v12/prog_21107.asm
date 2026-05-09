; DESCRIPTION: Composite: Places a purple dot at position (213, 244) then Draws a green line from (184, 108) to (153, 82) then Draws a green rectangle at (412, 140) with width 94 and height 114.
; PLAN: r0=213(x), r1=244(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=108(y1), r7=153(x2), r8=82(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=412(x), r11=140(y), r12=94(width), r13=114(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 244
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 108
LDI r7, 153
LDI r8, 82
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 140
LDI r12, 94
LDI r13, 114
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
