; DESCRIPTION: Composite: Places a orange dot at position (368, 109) then Draws a white rectangle at (360, 152) with width 38 and height 15 then Places a green line segment connecting (322, 152) to (115, 172).
; PLAN: r0=368(x), r1=109(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=152(y), r7=38(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=322(x1), r11=152(y1), r12=115(x2), r13=172(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 109
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 360
LDI r6, 152
LDI r7, 38
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 152
LDI r12, 115
LDI r13, 172
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
