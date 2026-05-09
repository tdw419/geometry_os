; DESCRIPTION: Composite: Draws a purple line from (429, 24) to (468, 204) then Places a white dot at position (7, 166) then Draws a black rectangle at (275, 184) with width 96 and height 24.
; PLAN: r0=429(x1), r1=24(y1), r2=468(x2), r3=204(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=166(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=275(x), r11=184(y), r12=96(width), r13=24(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 24
LDI r2, 468
LDI r3, 204
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 166
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 275
LDI r11, 184
LDI r12, 96
LDI r13, 24
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
