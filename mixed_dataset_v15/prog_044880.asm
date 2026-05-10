; DESCRIPTION: Composite: Draws a purple rectangle at (446, 102) with width 13 and height 84 then Sets a single cyan pixel at (385, 42).
; PLAN: r0=446(x), r1=102(y), r2=13(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 446
LDI r1, 102
LDI r2, 13
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
