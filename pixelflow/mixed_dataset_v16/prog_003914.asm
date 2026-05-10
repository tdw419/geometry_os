; DESCRIPTION: Composite: Sets a single magenta pixel at (0, 81) then Places a green line segment connecting (246, 181) to (477, 97) then Draws a red rectangle at (360, 75) with width 117 and height 104.
; PLAN: r0=0(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=246(x1), r6=181(y1), r7=477(x2), r8=97(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=75(y), r12=117(width), r13=104(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 181
LDI r7, 477
LDI r8, 97
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 75
LDI r12, 117
LDI r13, 104
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
