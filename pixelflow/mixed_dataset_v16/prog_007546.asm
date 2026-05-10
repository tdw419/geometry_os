; DESCRIPTION: Composite: Places a yellow dot at position (503, 199) then Draws a cyan rectangle at (137, 41) with width 104 and height 101 then Places a purple line segment connecting (322, 51) to (360, 215).
; PLAN: r0=503(x), r1=199(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=137(x), r6=41(y), r7=104(width), r8=101(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=322(x1), r11=51(y1), r12=360(x2), r13=215(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 503
LDI r1, 199
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 137
LDI r6, 41
LDI r7, 104
LDI r8, 101
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 51
LDI r12, 360
LDI r13, 215
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
