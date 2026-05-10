; DESCRIPTION: Composite: Places a yellow dot at position (134, 119) then Draws a yellow rectangle at (366, 133) with width 96 and height 100.
; PLAN: r0=134(x), r1=119(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=133(y), r7=96(width), r8=100(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 119
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 366
LDI r6, 133
LDI r7, 96
LDI r8, 100
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
