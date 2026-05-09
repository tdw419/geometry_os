; DESCRIPTION: Composite: Draws a orange rectangle at (331, 74) with width 54 and height 64 then Places a purple dot at position (120, 25).
; PLAN: r0=331(x), r1=74(y), r2=54(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=25(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 74
LDI r2, 54
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 25
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
