; DESCRIPTION: Composite: Draws a cyan rectangle at (185, 79) with width 42 and height 71 then Places a purple dot at position (377, 89).
; PLAN: r0=185(x), r1=79(y), r2=42(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=377(x), r6=89(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 79
LDI r2, 42
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 89
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
