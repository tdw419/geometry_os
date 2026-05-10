; DESCRIPTION: Composite: Draws a red rectangle at (60, 162) with width 51 and height 52 then Places a yellow dot at position (110, 246).
; PLAN: r0=60(x), r1=162(y), r2=51(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=246(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 162
LDI r2, 51
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 246
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
