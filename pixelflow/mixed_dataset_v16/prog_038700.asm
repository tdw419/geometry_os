; DESCRIPTION: Composite: Places a blue dot at position (319, 3) then Draws a yellow line from (509, 24) to (113, 55) then Draws a magenta circle centered at (81, 60) with radius 41.
; PLAN: r0=319(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=509(x1), r6=24(y1), r7=113(x2), r8=55(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=60(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 319
LDI r1, 3
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 509
LDI r6, 24
LDI r7, 113
LDI r8, 55
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 60
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
