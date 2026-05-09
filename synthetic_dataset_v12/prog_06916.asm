; DESCRIPTION: Composite: Places a cyan line segment connecting (219, 66) to (464, 215) then Draws a blue rectangle at (378, 150) with width 11 and height 15 then Places a orange dot at position (236, 114).
; PLAN: r0=219(x1), r1=66(y1), r2=464(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=150(y), r7=11(width), r8=15(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x), r11=114(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 219
LDI r1, 66
LDI r2, 464
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 150
LDI r7, 11
LDI r8, 15
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 114
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
