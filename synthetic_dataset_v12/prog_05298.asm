; DESCRIPTION: Composite: Draws a magenta rectangle at (42, 216) with width 57 and height 37 then Sets a single purple pixel at (109, 81).
; PLAN: r0=42(x), r1=216(y), r2=57(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x), r6=81(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 216
LDI r2, 57
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 81
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
