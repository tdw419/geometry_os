; DESCRIPTION: Composite: Draws a cyan rectangle at (17, 110) with width 90 and height 48 then Places a purple dot at position (213, 154) then Draws a purple line from (348, 98) to (244, 139).
; PLAN: r0=17(x), r1=110(y), r2=90(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=154(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=348(x1), r11=98(y1), r12=244(x2), r13=139(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 110
LDI r2, 90
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 154
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 348
LDI r11, 98
LDI r12, 244
LDI r13, 139
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
