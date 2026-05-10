; DESCRIPTION: Composite: Sets a single blue pixel at (205, 226) then Draws a purple rectangle at (35, 146) with width 70 and height 48 then Places a cyan line segment connecting (208, 127) to (497, 97).
; PLAN: r0=205(x), r1=226(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=35(x), r6=146(y), r7=70(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x1), r11=127(y1), r12=497(x2), r13=97(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 205
LDI r1, 226
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 35
LDI r6, 146
LDI r7, 70
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 127
LDI r12, 497
LDI r13, 97
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
