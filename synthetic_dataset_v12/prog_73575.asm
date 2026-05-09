; DESCRIPTION: Composite: Draws a purple rectangle at (179, 19) with width 13 and height 56 then Sets a single purple pixel at (387, 47) then Places a cyan line segment connecting (296, 65) to (291, 109).
; PLAN: r0=179(x), r1=19(y), r2=13(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=47(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=296(x1), r11=65(y1), r12=291(x2), r13=109(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 19
LDI r2, 13
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 47
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 296
LDI r11, 65
LDI r12, 291
LDI r13, 109
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
