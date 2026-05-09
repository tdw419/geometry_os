; DESCRIPTION: Composite: Places a red 64x67 rectangle at position (57, 125) then Sets a single black pixel at (108, 21).
; PLAN: r0=57(x), r1=125(y), r2=64(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=21(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 125
LDI r2, 64
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 21
LDI r7, 0x000000
PSET r5, r6, r7
HALT
