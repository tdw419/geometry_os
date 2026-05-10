; DESCRIPTION: Composite: Places a blue 41x105 rectangle at position (304, 53) then Places a cyan dot at position (510, 234).
; PLAN: r0=304(x), r1=53(y), r2=41(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=510(x), r6=234(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 304
LDI r1, 53
LDI r2, 41
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 234
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
