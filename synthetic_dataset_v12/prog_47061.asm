; DESCRIPTION: Composite: Places a purple line segment connecting (373, 87) to (291, 183) then Draws a blue rectangle at (303, 150) with width 11 and height 58 then Sets a single purple pixel at (495, 69).
; PLAN: r0=373(x1), r1=87(y1), r2=291(x2), r3=183(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=150(y), r7=11(width), r8=58(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=495(x), r11=69(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 87
LDI r2, 291
LDI r3, 183
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 150
LDI r7, 11
LDI r8, 58
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 495
LDI r11, 69
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
