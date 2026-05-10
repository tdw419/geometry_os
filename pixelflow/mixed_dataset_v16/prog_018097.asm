; DESCRIPTION: Composite: Renders a orange line between points (35, 29) and (195, 89) then Places a black dot at position (434, 16) then Renders a orange box of size 37x104 starting at (249, 124).
; PLAN: r0=35(x1), r1=29(y1), r2=195(x2), r3=89(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=434(x), r6=16(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=124(y), r12=37(width), r13=104(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 29
LDI r2, 195
LDI r3, 89
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 16
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 249
LDI r11, 124
LDI r12, 37
LDI r13, 104
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
