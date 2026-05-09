; DESCRIPTION: Composite: Renders a cyan box of size 29x76 starting at (307, 51) then Places a orange dot at position (171, 192) then Draws a black line from (499, 86) to (312, 188).
; PLAN: r0=307(x), r1=51(y), r2=29(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=171(x), r6=192(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=499(x1), r11=86(y1), r12=312(x2), r13=188(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 307
LDI r1, 51
LDI r2, 29
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 171
LDI r6, 192
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 499
LDI r11, 86
LDI r12, 312
LDI r13, 188
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
