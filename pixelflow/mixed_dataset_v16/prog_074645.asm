; DESCRIPTION: Composite: Places a orange line segment connecting (41, 24) to (439, 197) then Places a yellow 109x39 rectangle at position (92, 159) then Sets a single red pixel at (427, 48).
; PLAN: r0=41(x1), r1=24(y1), r2=439(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=92(x), r6=159(y), r7=109(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=427(x), r11=48(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 41
LDI r1, 24
LDI r2, 439
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 92
LDI r6, 159
LDI r7, 109
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 427
LDI r11, 48
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
