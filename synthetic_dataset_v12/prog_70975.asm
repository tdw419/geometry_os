; DESCRIPTION: Composite: Sets a single black pixel at (351, 72) then Draws a black rectangle at (316, 116) with width 80 and height 80 then Places a cyan line segment connecting (60, 16) to (103, 87).
; PLAN: r0=351(x), r1=72(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=116(y), r7=80(width), r8=80(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=60(x1), r11=16(y1), r12=103(x2), r13=87(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 72
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 316
LDI r6, 116
LDI r7, 80
LDI r8, 80
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 16
LDI r12, 103
LDI r13, 87
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
