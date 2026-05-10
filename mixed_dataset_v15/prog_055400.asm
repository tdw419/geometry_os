; DESCRIPTION: Composite: Places a orange line segment connecting (240, 151) to (408, 67) then Places a magenta 16x41 rectangle at position (418, 201) then Places a magenta dot at position (342, 35).
; PLAN: r0=240(x1), r1=151(y1), r2=408(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=201(y), r7=16(width), r8=41(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=35(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 151
LDI r2, 408
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 201
LDI r7, 16
LDI r8, 41
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 35
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
