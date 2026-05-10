; DESCRIPTION: Composite: Places a yellow 114x92 rectangle at position (276, 38) then Places a orange dot at position (467, 59).
; PLAN: r0=276(x), r1=38(y), r2=114(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=467(x), r6=59(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 38
LDI r2, 114
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 59
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
