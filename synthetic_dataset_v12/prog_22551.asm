; DESCRIPTION: Composite: Places a purple dot at position (342, 21) then Renders a orange box of size 89x47 starting at (375, 185) then Draws a white line from (5, 72) to (68, 238).
; PLAN: r0=342(x), r1=21(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=185(y), r7=89(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=5(x1), r11=72(y1), r12=68(x2), r13=238(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 185
LDI r7, 89
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 5
LDI r11, 72
LDI r12, 68
LDI r13, 238
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
