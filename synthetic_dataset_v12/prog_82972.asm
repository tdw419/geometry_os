; DESCRIPTION: Composite: Draws a magenta circle centered at (494, 220) with radius 12 then Draws a yellow line from (210, 172) to (449, 185) then Places a orange 26x39 rectangle at position (430, 93).
; PLAN: r0=494(x), r1=220(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=172(y1), r7=449(x2), r8=185(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=430(x), r11=93(y), r12=26(width), r13=39(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 220
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 172
LDI r7, 449
LDI r8, 185
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 93
LDI r12, 26
LDI r13, 39
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
