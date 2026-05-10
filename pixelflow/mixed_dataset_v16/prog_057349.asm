; DESCRIPTION: Composite: Places a orange 118x36 rectangle at position (206, 107) then Places a orange dot at position (484, 128).
; PLAN: r0=206(x), r1=107(y), r2=118(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=484(x), r6=128(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 206
LDI r1, 107
LDI r2, 118
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 128
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
