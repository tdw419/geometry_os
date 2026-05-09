; DESCRIPTION: Composite: Renders a orange line between points (81, 101) and (122, 207) then Places a black dot at position (252, 231).
; PLAN: r0=81(x1), r1=101(y1), r2=122(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=231(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 81
LDI r1, 101
LDI r2, 122
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 231
LDI r7, 0x000000
PSET r5, r6, r7
HALT
