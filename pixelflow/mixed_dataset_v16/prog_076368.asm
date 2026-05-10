; DESCRIPTION: Composite: Draws a black rectangle at (395, 61) with width 26 and height 55 then Draws a purple line from (284, 218) to (217, 63) then Places a black dot at position (41, 249).
; PLAN: r0=395(x), r1=61(y), r2=26(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x1), r6=218(y1), r7=217(x2), r8=63(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=41(x), r11=249(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 395
LDI r1, 61
LDI r2, 26
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 218
LDI r7, 217
LDI r8, 63
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 41
LDI r11, 249
LDI r12, 0x000000
PSET r10, r11, r12
HALT
