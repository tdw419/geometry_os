; DESCRIPTION: Composite: Sets a single yellow pixel at (16, 43) then Draws a red rectangle at (203, 106) with width 51 and height 59 then Places a white line segment connecting (227, 108) to (424, 139).
; PLAN: r0=16(x), r1=43(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=106(y), r7=51(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x1), r11=108(y1), r12=424(x2), r13=139(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 43
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 203
LDI r6, 106
LDI r7, 51
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 108
LDI r12, 424
LDI r13, 139
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
