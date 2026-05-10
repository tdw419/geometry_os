; DESCRIPTION: Composite: Draws a cyan rectangle at (342, 47) with width 29 and height 12 then Places a purple dot at position (449, 85) then Places a magenta line segment connecting (206, 235) to (11, 250).
; PLAN: r0=342(x), r1=47(y), r2=29(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=449(x), r6=85(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=206(x1), r11=235(y1), r12=11(x2), r13=250(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 47
LDI r2, 29
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 85
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 206
LDI r11, 235
LDI r12, 11
LDI r13, 250
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
