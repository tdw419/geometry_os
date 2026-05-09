; DESCRIPTION: Composite: Creates a black rectangular region at (218, 159) spanning 15 by 70 pixels then Places a cyan dot at position (239, 87).
; PLAN: r0=218(x), r1=159(y), r2=15(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=87(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 159
LDI r2, 15
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 87
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
