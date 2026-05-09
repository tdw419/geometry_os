; DESCRIPTION: Composite: Renders a blue box of size 52x15 starting at (423, 151) then Places a purple dot at position (85, 233).
; PLAN: r0=423(x), r1=151(y), r2=52(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=233(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 423
LDI r1, 151
LDI r2, 52
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 233
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
