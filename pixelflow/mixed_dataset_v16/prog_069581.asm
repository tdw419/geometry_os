; DESCRIPTION: Composite: Places a red dot at position (330, 249) then Places a yellow 25x84 rectangle at position (138, 168) then Draws a green circle centered at (406, 105) with radius 22.
; PLAN: r0=330(x), r1=249(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=168(y), r7=25(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=406(x), r11=105(y), r12=22(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 249
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 168
LDI r7, 25
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 105
LDI r12, 22
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
