; DESCRIPTION: Composite: Sets a single cyan pixel at (15, 213) then Places a blue line segment connecting (459, 23) to (151, 178) then Draws a red rectangle at (72, 167) with width 10 and height 57.
; PLAN: r0=15(x), r1=213(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=459(x1), r6=23(y1), r7=151(x2), r8=178(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=167(y), r12=10(width), r13=57(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 213
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 459
LDI r6, 23
LDI r7, 151
LDI r8, 178
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 167
LDI r12, 10
LDI r13, 57
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
