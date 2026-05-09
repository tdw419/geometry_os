; DESCRIPTION: Composite: Places a yellow 21x78 rectangle at position (78, 134) then Places a orange dot at position (6, 143).
; PLAN: r0=78(x), r1=134(y), r2=21(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=6(x), r6=143(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 78
LDI r1, 134
LDI r2, 21
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 143
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
