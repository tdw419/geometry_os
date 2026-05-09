; DESCRIPTION: Composite: Draws a red rectangle at (162, 109) with width 46 and height 113 then Places a cyan dot at position (508, 149) then Draws a yellow circle centered at (115, 185) with radius 50.
; PLAN: r0=162(x), r1=109(y), r2=46(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=508(x), r6=149(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=115(x), r11=185(y), r12=50(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 162
LDI r1, 109
LDI r2, 46
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 508
LDI r6, 149
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 115
LDI r11, 185
LDI r12, 50
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
