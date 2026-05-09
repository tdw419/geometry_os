; DESCRIPTION: Composite: Places a red 75x62 rectangle at position (296, 50) then Places a black dot at position (309, 133).
; PLAN: r0=296(x), r1=50(y), r2=75(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=133(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 50
LDI r2, 75
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 133
LDI r7, 0x000000
PSET r5, r6, r7
HALT
