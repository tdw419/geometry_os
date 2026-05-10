; DESCRIPTION: Composite: Draws a purple rectangle at (57, 12) with width 103 and height 63 then Sets a single orange pixel at (243, 8).
; PLAN: r0=57(x), r1=12(y), r2=103(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x), r6=8(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 12
LDI r2, 103
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 8
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
