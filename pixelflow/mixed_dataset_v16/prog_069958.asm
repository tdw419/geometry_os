; DESCRIPTION: Composite: Sets a single red pixel at (381, 213) then Renders a black box of size 41x49 starting at (11, 7) then Places a green line segment connecting (272, 126) to (71, 91).
; PLAN: r0=381(x), r1=213(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=11(x), r6=7(y), r7=41(width), r8=49(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x1), r11=126(y1), r12=71(x2), r13=91(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 213
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 11
LDI r6, 7
LDI r7, 41
LDI r8, 49
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 126
LDI r12, 71
LDI r13, 91
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
