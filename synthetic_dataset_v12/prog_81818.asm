; DESCRIPTION: Composite: Places a black 10x62 rectangle at position (46, 146) then Places a red dot at position (52, 45).
; PLAN: r0=46(x), r1=146(y), r2=10(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=45(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 146
LDI r2, 10
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 45
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
