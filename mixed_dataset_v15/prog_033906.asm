; DESCRIPTION: Composite: Draws a green rectangle at (196, 38) with width 107 and height 24 then Places a orange dot at position (19, 229).
; PLAN: r0=196(x), r1=38(y), r2=107(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x), r6=229(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 196
LDI r1, 38
LDI r2, 107
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 229
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
