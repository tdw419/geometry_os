; DESCRIPTION: Composite: Draws a orange rectangle at (365, 187) with width 54 and height 69 then Places a blue dot at position (73, 176).
; PLAN: r0=365(x), r1=187(y), r2=54(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=176(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 187
LDI r2, 54
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 176
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
