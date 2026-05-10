; DESCRIPTION: Composite: Draws a white rectangle at (286, 57) with width 42 and height 95 then Places a black dot at position (491, 208).
; PLAN: r0=286(x), r1=57(y), r2=42(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=491(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 286
LDI r1, 57
LDI r2, 42
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 491
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
HALT
