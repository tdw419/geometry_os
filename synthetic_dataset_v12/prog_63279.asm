; DESCRIPTION: Composite: Creates a green rectangular region at (28, 98) spanning 87 by 19 pixels then Places a red dot at position (204, 87).
; PLAN: r0=28(x), r1=98(y), r2=87(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=87(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 28
LDI r1, 98
LDI r2, 87
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 87
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
