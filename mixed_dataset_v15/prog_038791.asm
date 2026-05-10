; DESCRIPTION: Composite: Draws a purple line from (258, 24) to (230, 88) then Draws a cyan rectangle at (95, 143) with width 49 and height 31 then Sets a single white pixel at (382, 76).
; PLAN: r0=258(x1), r1=24(y1), r2=230(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=143(y), r7=49(width), r8=31(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=382(x), r11=76(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 24
LDI r2, 230
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 143
LDI r7, 49
LDI r8, 31
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 76
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
