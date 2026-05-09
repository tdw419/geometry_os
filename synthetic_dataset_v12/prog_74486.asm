; DESCRIPTION: Composite: Creates a cyan rectangular region at (37, 42) spanning 78 by 41 pixels then Places a red dot at position (18, 12).
; PLAN: r0=37(x), r1=42(y), r2=78(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=12(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 42
LDI r2, 78
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 12
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
