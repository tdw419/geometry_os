; DESCRIPTION: Composite: Places a purple 114x53 rectangle at position (281, 143) then Places a orange dot at position (78, 179).
; PLAN: r0=281(x), r1=143(y), r2=114(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=179(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 281
LDI r1, 143
LDI r2, 114
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 179
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
