; DESCRIPTION: Composite: Creates a white rectangular region at (309, 11) spanning 96 by 19 pixels then Places a cyan line segment connecting (290, 207) to (37, 41) then Sets a single magenta pixel at (345, 59).
; PLAN: r0=309(x), r1=11(y), r2=96(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=207(y1), r7=37(x2), r8=41(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=345(x), r11=59(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 11
LDI r2, 96
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 207
LDI r7, 37
LDI r8, 41
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 345
LDI r11, 59
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
