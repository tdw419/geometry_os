; DESCRIPTION: Composite: Creates a cyan rectangular region at (382, 4) spanning 111 by 66 pixels then Places a cyan dot at position (88, 119) then Draws a orange line from (179, 126) to (19, 184).
; PLAN: r0=382(x), r1=4(y), r2=111(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=119(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=179(x1), r11=126(y1), r12=19(x2), r13=184(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 4
LDI r2, 111
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 119
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 179
LDI r11, 126
LDI r12, 19
LDI r13, 184
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
