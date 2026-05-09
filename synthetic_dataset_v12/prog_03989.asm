; DESCRIPTION: Composite: Renders a cyan box of size 63x97 starting at (272, 106) then Places a magenta dot at position (52, 153).
; PLAN: r0=272(x), r1=106(y), r2=63(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=153(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 106
LDI r2, 63
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 153
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
