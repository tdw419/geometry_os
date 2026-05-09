; DESCRIPTION: Composite: Draws a cyan line from (304, 133) to (494, 78) then Places a yellow 37x18 rectangle at position (131, 124) then Draws a orange circle centered at (212, 132) with radius 65.
; PLAN: r0=304(x1), r1=133(y1), r2=494(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=131(x), r6=124(y), r7=37(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x), r11=132(y), r12=65(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 133
LDI r2, 494
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 124
LDI r7, 37
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 132
LDI r12, 65
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
