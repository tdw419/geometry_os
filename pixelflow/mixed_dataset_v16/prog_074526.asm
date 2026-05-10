; DESCRIPTION: Composite: Places a orange line segment connecting (187, 82) to (411, 107) then Draws a cyan rectangle at (71, 0) with width 100 and height 69 then Places a yellow dot at position (269, 205).
; PLAN: r0=187(x1), r1=82(y1), r2=411(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=0(y), r7=100(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x), r11=205(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 82
LDI r2, 411
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 0
LDI r7, 100
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 205
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
