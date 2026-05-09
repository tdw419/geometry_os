; DESCRIPTION: Composite: Renders a cyan box of size 117x66 starting at (58, 172) then Places a green line segment connecting (150, 123) to (267, 53) then Places a orange dot at position (331, 109).
; PLAN: r0=58(x), r1=172(y), r2=117(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=123(y1), r7=267(x2), r8=53(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=109(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 172
LDI r2, 117
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 123
LDI r7, 267
LDI r8, 53
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 109
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
