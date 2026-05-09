; DESCRIPTION: Composite: Draws a white line from (187, 156) to (420, 12) then Places a red 103x78 rectangle at position (44, 18) then Sets a single green pixel at (311, 249).
; PLAN: r0=187(x1), r1=156(y1), r2=420(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=44(x), r6=18(y), r7=103(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=249(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 156
LDI r2, 420
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 44
LDI r6, 18
LDI r7, 103
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 249
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
