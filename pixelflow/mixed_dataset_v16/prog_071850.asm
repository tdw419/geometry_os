; DESCRIPTION: Composite: Draws a green rectangle at (144, 62) with width 113 and height 93 then Places a yellow circle of radius 19 at center (61, 31) then Draws a white line from (483, 60) to (319, 233).
; PLAN: r0=144(x), r1=62(y), r2=113(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x), r6=31(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=483(x1), r11=60(y1), r12=319(x2), r13=233(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 144
LDI r1, 62
LDI r2, 113
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 31
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 483
LDI r11, 60
LDI r12, 319
LDI r13, 233
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
