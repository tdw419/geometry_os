; DESCRIPTION: Composite: Places a yellow dot at position (75, 5) then Creates a white rectangular region at (126, 41) spanning 34 by 120 pixels then Places a cyan line segment connecting (272, 232) to (302, 161).
; PLAN: r0=75(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=41(y), r7=34(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x1), r11=232(y1), r12=302(x2), r13=161(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 126
LDI r6, 41
LDI r7, 34
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 232
LDI r12, 302
LDI r13, 161
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
