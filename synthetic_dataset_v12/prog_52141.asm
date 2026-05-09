; DESCRIPTION: Composite: Draws a magenta rectangle at (473, 9) with width 35 and height 87 then Places a yellow dot at position (395, 220) then Draws a orange line from (72, 225) to (184, 166).
; PLAN: r0=473(x), r1=9(y), r2=35(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x), r6=220(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=72(x1), r11=225(y1), r12=184(x2), r13=166(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 9
LDI r2, 35
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 220
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 72
LDI r11, 225
LDI r12, 184
LDI r13, 166
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
