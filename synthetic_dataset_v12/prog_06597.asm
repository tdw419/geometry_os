; DESCRIPTION: Composite: Sets a single red pixel at (4, 191) then Places a white line segment connecting (445, 155) to (324, 42) then Places a red 46x62 rectangle at position (6, 107).
; PLAN: r0=4(x), r1=191(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=155(y1), r7=324(x2), r8=42(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=6(x), r11=107(y), r12=46(width), r13=62(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 4
LDI r1, 191
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 445
LDI r6, 155
LDI r7, 324
LDI r8, 42
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 107
LDI r12, 46
LDI r13, 62
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
