; DESCRIPTION: Composite: Renders a magenta box of size 26x107 starting at (319, 24) then Places a magenta dot at position (236, 74).
; PLAN: r0=319(x), r1=24(y), r2=26(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=236(x), r6=74(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 24
LDI r2, 26
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 236
LDI r6, 74
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
