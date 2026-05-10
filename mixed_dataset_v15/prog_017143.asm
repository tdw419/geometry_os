; DESCRIPTION: Composite: Draws a magenta rectangle at (169, 93) with width 54 and height 105 then Sets a single cyan pixel at (367, 19).
; PLAN: r0=169(x), r1=93(y), r2=54(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=19(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 93
LDI r2, 54
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 19
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
