; DESCRIPTION: Composite: Draws a yellow line from (475, 149) to (172, 188) then Places a orange 23x25 rectangle at position (138, 98).
; PLAN: r0=475(x1), r1=149(y1), r2=172(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=98(y), r7=23(width), r8=25(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 149
LDI r2, 172
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 98
LDI r7, 23
LDI r8, 25
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
