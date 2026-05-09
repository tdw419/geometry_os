; DESCRIPTION: Composite: Places a red dot at position (324, 49) then Draws a blue rectangle at (11, 56) with width 99 and height 82 then Places a cyan line segment connecting (348, 122) to (303, 240).
; PLAN: r0=324(x), r1=49(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=56(y), r7=99(width), r8=82(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x1), r11=122(y1), r12=303(x2), r13=240(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 49
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 11
LDI r6, 56
LDI r7, 99
LDI r8, 82
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 122
LDI r12, 303
LDI r13, 240
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
