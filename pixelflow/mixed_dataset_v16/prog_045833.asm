; DESCRIPTION: Composite: Places a white dot at position (481, 140) then Draws a red rectangle at (140, 147) with width 41 and height 67.
; PLAN: r0=481(x), r1=140(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=147(y), r7=41(width), r8=67(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 140
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 147
LDI r7, 41
LDI r8, 67
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
