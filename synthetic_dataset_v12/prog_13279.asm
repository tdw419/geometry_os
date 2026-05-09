; DESCRIPTION: Composite: Creates a white rectangular region at (108, 151) spanning 99 by 64 pixels then Places a cyan dot at position (121, 17).
; PLAN: r0=108(x), r1=151(y), r2=99(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=121(x), r6=17(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 151
LDI r2, 99
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 17
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
