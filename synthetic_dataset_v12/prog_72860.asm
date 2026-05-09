; DESCRIPTION: Composite: Draws a blue rectangle at (82, 166) with width 99 and height 22 then Places a red dot at position (164, 109).
; PLAN: r0=82(x), r1=166(y), r2=99(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=164(x), r6=109(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 82
LDI r1, 166
LDI r2, 99
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 109
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
