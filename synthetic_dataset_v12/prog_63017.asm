; DESCRIPTION: Composite: Draws a orange line from (94, 227) to (226, 59) then Places a black 25x35 rectangle at position (399, 1).
; PLAN: r0=94(x1), r1=227(y1), r2=226(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=1(y), r7=25(width), r8=35(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 227
LDI r2, 226
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 1
LDI r7, 25
LDI r8, 35
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
