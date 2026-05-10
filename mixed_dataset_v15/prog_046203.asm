; DESCRIPTION: Composite: Draws a orange rectangle at (106, 127) with width 96 and height 87 then Sets a single blue pixel at (262, 54).
; PLAN: r0=106(x), r1=127(y), r2=96(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=262(x), r6=54(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 127
LDI r2, 96
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 54
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
