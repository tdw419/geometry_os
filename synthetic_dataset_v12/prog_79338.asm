; DESCRIPTION: Composite: Places a white dot at position (315, 206) then Places a black line segment connecting (105, 187) to (97, 48) then Draws a cyan rectangle at (67, 61) with width 95 and height 19.
; PLAN: r0=315(x), r1=206(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=105(x1), r6=187(y1), r7=97(x2), r8=48(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=61(y), r12=95(width), r13=19(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 206
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 187
LDI r7, 97
LDI r8, 48
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 61
LDI r12, 95
LDI r13, 19
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
