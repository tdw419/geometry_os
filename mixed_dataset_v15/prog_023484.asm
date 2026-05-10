; DESCRIPTION: Composite: Draws a green circle centered at (303, 124) with radius 59 then Places a orange 19x116 rectangle at position (362, 77) then Draws a orange line from (438, 18) to (4, 72).
; PLAN: r0=303(x), r1=124(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x), r6=77(y), r7=19(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x1), r11=18(y1), r12=4(x2), r13=72(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 124
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 77
LDI r7, 19
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 18
LDI r12, 4
LDI r13, 72
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
