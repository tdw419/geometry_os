; DESCRIPTION: Composite: Draws a cyan rectangle at (229, 23) with width 25 and height 36 then Places a cyan dot at position (322, 94) then Places a orange line segment connecting (131, 136) to (155, 204).
; PLAN: r0=229(x), r1=23(y), r2=25(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=94(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=131(x1), r11=136(y1), r12=155(x2), r13=204(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 23
LDI r2, 25
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 94
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 131
LDI r11, 136
LDI r12, 155
LDI r13, 204
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
