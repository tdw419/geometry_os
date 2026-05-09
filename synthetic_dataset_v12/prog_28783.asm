; DESCRIPTION: Composite: Draws a blue rectangle at (258, 172) with width 19 and height 74 then Renders a magenta line between points (103, 91) and (494, 236) then Sets a single red pixel at (99, 38).
; PLAN: r0=258(x), r1=172(y), r2=19(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=103(x1), r6=91(y1), r7=494(x2), r8=236(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=38(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 172
LDI r2, 19
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 91
LDI r7, 494
LDI r8, 236
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 38
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
