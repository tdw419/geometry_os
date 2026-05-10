; DESCRIPTION: Composite: Places a magenta dot at position (121, 236) then Draws a cyan rectangle at (102, 144) with width 42 and height 68 then Places a black line segment connecting (497, 0) to (19, 179).
; PLAN: r0=121(x), r1=236(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=102(x), r6=144(y), r7=42(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x1), r11=0(y1), r12=19(x2), r13=179(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 236
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 102
LDI r6, 144
LDI r7, 42
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 0
LDI r12, 19
LDI r13, 179
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
