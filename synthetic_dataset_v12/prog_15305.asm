; DESCRIPTION: Composite: Draws a white rectangle at (68, 53) with width 41 and height 77 then Places a cyan dot at position (215, 147).
; PLAN: r0=68(x), r1=53(y), r2=41(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=215(x), r6=147(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 68
LDI r1, 53
LDI r2, 41
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 147
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
