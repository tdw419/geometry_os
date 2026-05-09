; DESCRIPTION: Composite: Places a orange dot at position (65, 52) then Places a purple 27x102 rectangle at position (200, 66) then Draws a red circle centered at (141, 231) with radius 10.
; PLAN: r0=65(x), r1=52(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=66(y), r7=27(width), r8=102(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=231(y), r12=10(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 52
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 200
LDI r6, 66
LDI r7, 27
LDI r8, 102
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 231
LDI r12, 10
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
