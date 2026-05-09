; DESCRIPTION: Composite: Draws a yellow rectangle at (400, 158) with width 45 and height 72 then Places a red line segment connecting (247, 116) to (29, 108) then Sets a single yellow pixel at (481, 239).
; PLAN: r0=400(x), r1=158(y), r2=45(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x1), r6=116(y1), r7=29(x2), r8=108(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=481(x), r11=239(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 158
LDI r2, 45
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 116
LDI r7, 29
LDI r8, 108
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 481
LDI r11, 239
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
