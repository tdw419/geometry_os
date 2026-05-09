; DESCRIPTION: Composite: Places a black dot at position (508, 211) then Draws a black rectangle at (199, 117) with width 63 and height 110 then Draws a yellow line from (313, 94) to (35, 57).
; PLAN: r0=508(x), r1=211(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=117(y), r7=63(width), r8=110(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x1), r11=94(y1), r12=35(x2), r13=57(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 211
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 199
LDI r6, 117
LDI r7, 63
LDI r8, 110
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 94
LDI r12, 35
LDI r13, 57
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
