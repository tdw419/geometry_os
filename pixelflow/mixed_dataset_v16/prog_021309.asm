; DESCRIPTION: Composite: Renders a magenta box of size 84x49 starting at (9, 122) then Draws a black line from (107, 116) to (497, 124) then Places a cyan dot at position (353, 205).
; PLAN: r0=9(x), r1=122(y), r2=84(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x1), r6=116(y1), r7=497(x2), r8=124(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=205(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 122
LDI r2, 84
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 116
LDI r7, 497
LDI r8, 124
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 205
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
