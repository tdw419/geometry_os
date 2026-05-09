; DESCRIPTION: Composite: Draws a cyan circle centered at (193, 108) with radius 77 then Draws a red line from (365, 14) to (344, 170) then Places a blue 34x93 rectangle at position (280, 159).
; PLAN: r0=193(x), r1=108(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x1), r6=14(y1), r7=344(x2), r8=170(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=159(y), r12=34(width), r13=93(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 108
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 14
LDI r7, 344
LDI r8, 170
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 159
LDI r12, 34
LDI r13, 93
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
