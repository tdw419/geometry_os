; DESCRIPTION: Composite: Places a black dot at position (196, 2) then Places a cyan line segment connecting (240, 189) to (493, 171) then Creates a orange rectangular region at (360, 45) spanning 90 by 41 pixels.
; PLAN: r0=196(x), r1=2(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=240(x1), r6=189(y1), r7=493(x2), r8=171(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=45(y), r12=90(width), r13=41(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 2
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 240
LDI r6, 189
LDI r7, 493
LDI r8, 171
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 45
LDI r12, 90
LDI r13, 41
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
