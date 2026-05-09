; DESCRIPTION: Composite: Renders a cyan box of size 44x73 starting at (334, 131) then Renders a white line between points (100, 175) and (246, 5) then Places a orange dot at position (112, 13).
; PLAN: r0=334(x), r1=131(y), r2=44(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x1), r6=175(y1), r7=246(x2), r8=5(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=13(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 334
LDI r1, 131
LDI r2, 44
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 175
LDI r7, 246
LDI r8, 5
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 13
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
