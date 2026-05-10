; DESCRIPTION: Composite: Draws a blue line from (169, 115) to (67, 226) then Draws a orange rectangle at (316, 68) with width 19 and height 56 then Sets a single purple pixel at (446, 240).
; PLAN: r0=169(x1), r1=115(y1), r2=67(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=68(y), r7=19(width), r8=56(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=446(x), r11=240(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 169
LDI r1, 115
LDI r2, 67
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 68
LDI r7, 19
LDI r8, 56
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 240
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
