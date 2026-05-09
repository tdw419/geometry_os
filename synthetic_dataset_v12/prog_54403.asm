; DESCRIPTION: Composite: Draws a blue rectangle at (241, 113) with width 10 and height 27 then Places a purple dot at position (429, 243).
; PLAN: r0=241(x), r1=113(y), r2=10(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=243(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 113
LDI r2, 10
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 243
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
