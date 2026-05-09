; DESCRIPTION: Composite: Draws a yellow rectangle at (117, 182) with width 110 and height 25 then Places a magenta dot at position (433, 234).
; PLAN: r0=117(x), r1=182(y), r2=110(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=234(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 117
LDI r1, 182
LDI r2, 110
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 234
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
