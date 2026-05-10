; DESCRIPTION: Composite: Draws a blue line from (114, 40) to (472, 164) then Places a purple 13x31 rectangle at position (325, 112).
; PLAN: r0=114(x1), r1=40(y1), r2=472(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=112(y), r7=13(width), r8=31(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 40
LDI r2, 472
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 112
LDI r7, 13
LDI r8, 31
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
