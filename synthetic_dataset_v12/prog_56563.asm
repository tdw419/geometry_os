; DESCRIPTION: Composite: Places a black 13x26 rectangle at position (273, 48) then Places a magenta dot at position (81, 41).
; PLAN: r0=273(x), r1=48(y), r2=13(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=41(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 273
LDI r1, 48
LDI r2, 13
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 41
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
