; DESCRIPTION: Composite: Draws a red circle centered at (85, 127) with radius 32 then Draws a yellow rectangle at (446, 150) with width 40 and height 81 then Places a purple dot at position (452, 79).
; PLAN: r0=85(x), r1=127(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=150(y), r7=40(width), r8=81(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x), r11=79(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 127
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 150
LDI r7, 40
LDI r8, 81
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 79
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
