; DESCRIPTION: Composite: Places a black dot at position (491, 99) then Places a black 16x98 rectangle at position (75, 50) then Places a yellow line segment connecting (89, 202) to (270, 11).
; PLAN: r0=491(x), r1=99(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=75(x), r6=50(y), r7=16(width), r8=98(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x1), r11=202(y1), r12=270(x2), r13=11(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 491
LDI r1, 99
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 75
LDI r6, 50
LDI r7, 16
LDI r8, 98
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 202
LDI r12, 270
LDI r13, 11
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
