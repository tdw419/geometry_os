; DESCRIPTION: Composite: Places a white dot at position (89, 231) then Draws a blue rectangle at (154, 64) with width 23 and height 41.
; PLAN: r0=89(x), r1=231(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=64(y), r7=23(width), r8=41(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 231
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 154
LDI r6, 64
LDI r7, 23
LDI r8, 41
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
