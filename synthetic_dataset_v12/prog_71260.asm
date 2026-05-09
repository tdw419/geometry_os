; DESCRIPTION: Composite: Places a red 69x39 rectangle at position (207, 25) then Sets a single orange pixel at (387, 16) then Draws a orange line from (181, 210) to (498, 238).
; PLAN: r0=207(x), r1=25(y), r2=69(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x), r6=16(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=181(x1), r11=210(y1), r12=498(x2), r13=238(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 25
LDI r2, 69
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 16
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 181
LDI r11, 210
LDI r12, 498
LDI r13, 238
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
