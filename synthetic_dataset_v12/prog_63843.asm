; DESCRIPTION: Composite: Draws a purple rectangle at (304, 181) with width 14 and height 61 then Places a cyan line segment connecting (11, 121) to (468, 138) then Places a cyan dot at position (501, 64).
; PLAN: r0=304(x), r1=181(y), r2=14(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=121(y1), r7=468(x2), r8=138(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=501(x), r11=64(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 181
LDI r2, 14
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 121
LDI r7, 468
LDI r8, 138
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 64
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
