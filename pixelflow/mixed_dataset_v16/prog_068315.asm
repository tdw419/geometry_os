; DESCRIPTION: Composite: Places a black dot at position (308, 104) then Draws a yellow line from (298, 156) to (342, 141) then Places a orange 18x104 rectangle at position (443, 45).
; PLAN: r0=308(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=298(x1), r6=156(y1), r7=342(x2), r8=141(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=443(x), r11=45(y), r12=18(width), r13=104(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 298
LDI r6, 156
LDI r7, 342
LDI r8, 141
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 443
LDI r11, 45
LDI r12, 18
LDI r13, 104
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
