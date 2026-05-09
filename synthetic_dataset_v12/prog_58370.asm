; DESCRIPTION: Composite: Places a black 43x90 rectangle at position (289, 44) then Places a black dot at position (237, 67).
; PLAN: r0=289(x), r1=44(y), r2=43(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=237(x), r6=67(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 44
LDI r2, 43
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 67
LDI r7, 0x000000
PSET r5, r6, r7
HALT
