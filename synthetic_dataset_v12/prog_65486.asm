; DESCRIPTION: Composite: Sets a single orange pixel at (59, 73) then Draws a white rectangle at (164, 7) with width 63 and height 28 then Places a purple line segment connecting (107, 135) to (144, 91).
; PLAN: r0=59(x), r1=73(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=7(y), r7=63(width), r8=28(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x1), r11=135(y1), r12=144(x2), r13=91(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 73
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 164
LDI r6, 7
LDI r7, 63
LDI r8, 28
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 135
LDI r12, 144
LDI r13, 91
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
