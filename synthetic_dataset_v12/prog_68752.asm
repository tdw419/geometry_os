; DESCRIPTION: Composite: Draws a yellow rectangle at (100, 104) with width 12 and height 96 then Places a cyan dot at position (52, 247).
; PLAN: r0=100(x), r1=104(y), r2=12(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=247(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 100
LDI r1, 104
LDI r2, 12
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 247
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
