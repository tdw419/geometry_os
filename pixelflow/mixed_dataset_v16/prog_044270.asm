; DESCRIPTION: Composite: Sets a single purple pixel at (354, 119) then Draws a white line from (408, 191) to (494, 49) then Renders a orange box of size 59x40 starting at (160, 17).
; PLAN: r0=354(x), r1=119(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=408(x1), r6=191(y1), r7=494(x2), r8=49(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=160(x), r11=17(y), r12=59(width), r13=40(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 119
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 408
LDI r6, 191
LDI r7, 494
LDI r8, 49
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 17
LDI r12, 59
LDI r13, 40
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
