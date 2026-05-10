; DESCRIPTION: Composite: Places a black dot at position (427, 40) then Draws a yellow rectangle at (123, 70) with width 16 and height 106.
; PLAN: r0=427(x), r1=40(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=70(y), r7=16(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 40
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 123
LDI r6, 70
LDI r7, 16
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
