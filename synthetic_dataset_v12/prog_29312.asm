; DESCRIPTION: Composite: Places a cyan dot at position (322, 81) then Renders a cyan box of size 49x83 starting at (241, 70) then Places a orange line segment connecting (347, 30) to (315, 110).
; PLAN: r0=322(x), r1=81(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=241(x), r6=70(y), r7=49(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x1), r11=30(y1), r12=315(x2), r13=110(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 81
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 241
LDI r6, 70
LDI r7, 49
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 30
LDI r12, 315
LDI r13, 110
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
