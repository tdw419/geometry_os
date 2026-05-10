; DESCRIPTION: Composite: Places a black dot at position (167, 180) then Places a white line segment connecting (93, 161) to (97, 12) then Places a black 13x16 rectangle at position (483, 196).
; PLAN: r0=167(x), r1=180(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=93(x1), r6=161(y1), r7=97(x2), r8=12(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=483(x), r11=196(y), r12=13(width), r13=16(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 167
LDI r1, 180
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 93
LDI r6, 161
LDI r7, 97
LDI r8, 12
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 196
LDI r12, 13
LDI r13, 16
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
