; DESCRIPTION: Composite: Places a black 120x39 rectangle at position (212, 87) then Places a purple dot at position (488, 68).
; PLAN: r0=212(x), r1=87(y), r2=120(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=68(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 87
LDI r2, 120
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 68
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
