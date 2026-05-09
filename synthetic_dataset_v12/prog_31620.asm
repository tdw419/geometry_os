; DESCRIPTION: Composite: Draws a magenta rectangle at (315, 111) with width 90 and height 36 then Draws a red line from (481, 56) to (246, 67) then Places a white dot at position (300, 69).
; PLAN: r0=315(x), r1=111(y), r2=90(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=481(x1), r6=56(y1), r7=246(x2), r8=67(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=300(x), r11=69(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 315
LDI r1, 111
LDI r2, 90
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 481
LDI r6, 56
LDI r7, 246
LDI r8, 67
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 300
LDI r11, 69
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
