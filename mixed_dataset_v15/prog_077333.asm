; DESCRIPTION: Composite: Renders a magenta box of size 15x99 starting at (15, 81) then Places a yellow dot at position (336, 144).
; PLAN: r0=15(x), r1=81(y), r2=15(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x), r6=144(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 15
LDI r1, 81
LDI r2, 15
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 144
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
