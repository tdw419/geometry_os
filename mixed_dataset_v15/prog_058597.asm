; DESCRIPTION: Composite: Draws a black line from (427, 134) to (287, 93) then Places a black 114x41 rectangle at position (61, 50).
; PLAN: r0=427(x1), r1=134(y1), r2=287(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=50(y), r7=114(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 134
LDI r2, 287
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 50
LDI r7, 114
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
