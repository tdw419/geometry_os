; DESCRIPTION: Composite: Places a yellow 97x65 rectangle at position (166, 116) then Places a red dot at position (314, 233).
; PLAN: r0=166(x), r1=116(y), r2=97(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=233(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 116
LDI r2, 97
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 233
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
