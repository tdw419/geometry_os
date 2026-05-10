; DESCRIPTION: Composite: Sets a single orange pixel at (24, 64) then Renders a blue box of size 78x41 starting at (434, 137) then Places a blue line segment connecting (276, 108) to (97, 222).
; PLAN: r0=24(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=137(y), r7=78(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=276(x1), r11=108(y1), r12=97(x2), r13=222(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 434
LDI r6, 137
LDI r7, 78
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 108
LDI r12, 97
LDI r13, 222
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
