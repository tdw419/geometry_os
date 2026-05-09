; DESCRIPTION: Composite: Draws a black line from (43, 171) to (234, 251) then Places a black 105x26 rectangle at position (128, 65).
; PLAN: r0=43(x1), r1=171(y1), r2=234(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=65(y), r7=105(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 43
LDI r1, 171
LDI r2, 234
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 65
LDI r7, 105
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
