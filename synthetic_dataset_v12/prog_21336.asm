; DESCRIPTION: Composite: Draws a purple rectangle at (188, 154) with width 57 and height 54 then Places a cyan dot at position (262, 59) then Places a white line segment connecting (340, 225) to (490, 67).
; PLAN: r0=188(x), r1=154(y), r2=57(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=59(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=340(x1), r11=225(y1), r12=490(x2), r13=67(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 154
LDI r2, 57
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 59
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 340
LDI r11, 225
LDI r12, 490
LDI r13, 67
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
