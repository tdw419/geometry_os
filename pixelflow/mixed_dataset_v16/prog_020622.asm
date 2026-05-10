; DESCRIPTION: Composite: Places a purple dot at position (443, 48) then Draws a cyan rectangle at (41, 43) with width 104 and height 89.
; PLAN: r0=443(x), r1=48(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=43(y), r7=104(width), r8=89(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 48
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 43
LDI r7, 104
LDI r8, 89
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
