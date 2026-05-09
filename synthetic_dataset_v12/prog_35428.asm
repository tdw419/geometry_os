; DESCRIPTION: Composite: Places a black dot at position (140, 187) then Renders a cyan line between points (278, 39) and (252, 72) then Places a red 14x107 rectangle at position (222, 117).
; PLAN: r0=140(x), r1=187(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=278(x1), r6=39(y1), r7=252(x2), r8=72(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=222(x), r11=117(y), r12=14(width), r13=107(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 187
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 278
LDI r6, 39
LDI r7, 252
LDI r8, 72
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 117
LDI r12, 14
LDI r13, 107
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
