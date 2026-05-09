; DESCRIPTION: Composite: Places a magenta dot at position (425, 181) then Draws a yellow circle centered at (328, 179) with radius 11.
; PLAN: r0=425(x), r1=181(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=328(x), r6=179(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 425
LDI r1, 181
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 328
LDI r6, 179
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
