; DESCRIPTION: Composite: Places a red line segment connecting (319, 251) to (55, 101) then Sets a single cyan pixel at (183, 231) then Places a cyan 65x108 rectangle at position (329, 95).
; PLAN: r0=319(x1), r1=251(y1), r2=55(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=231(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=329(x), r11=95(y), r12=65(width), r13=108(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 251
LDI r2, 55
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 231
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 329
LDI r11, 95
LDI r12, 65
LDI r13, 108
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
