; DESCRIPTION: Composite: Places a orange 73x41 rectangle at position (361, 85) then Places a magenta dot at position (161, 11).
; PLAN: r0=361(x), r1=85(y), r2=73(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=161(x), r6=11(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 361
LDI r1, 85
LDI r2, 73
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 11
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
