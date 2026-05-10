; DESCRIPTION: Composite: Places a black 114x78 rectangle at position (333, 73) then Places a white dot at position (18, 237).
; PLAN: r0=333(x), r1=73(y), r2=114(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x), r6=237(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 333
LDI r1, 73
LDI r2, 114
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 237
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
