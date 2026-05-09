; DESCRIPTION: Composite: Draws a red rectangle at (119, 13) with width 25 and height 60 then Places a purple dot at position (198, 119) then Draws a magenta line from (196, 222) to (183, 80).
; PLAN: r0=119(x), r1=13(y), r2=25(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=119(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=196(x1), r11=222(y1), r12=183(x2), r13=80(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 119
LDI r1, 13
LDI r2, 25
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 119
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 196
LDI r11, 222
LDI r12, 183
LDI r13, 80
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
