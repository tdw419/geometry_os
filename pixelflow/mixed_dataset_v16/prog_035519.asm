; DESCRIPTION: Composite: Creates a red rectangular region at (276, 177) spanning 39 by 28 pixels then Places a green dot at position (365, 195).
; PLAN: r0=276(x), r1=177(y), r2=39(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=195(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 276
LDI r1, 177
LDI r2, 39
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 195
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
