; DESCRIPTION: Composite: Draws a magenta rectangle at (76, 51) with width 64 and height 27 then Places a black dot at position (113, 157) then Draws a purple line from (125, 164) to (475, 129).
; PLAN: r0=76(x), r1=51(y), r2=64(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=157(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=125(x1), r11=164(y1), r12=475(x2), r13=129(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 51
LDI r2, 64
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 157
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 125
LDI r11, 164
LDI r12, 475
LDI r13, 129
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
