; DESCRIPTION: Composite: Places a red dot at position (449, 28) then Draws a blue circle centered at (326, 127) with radius 71.
; PLAN: r0=449(x), r1=28(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=326(x), r6=127(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 28
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 326
LDI r6, 127
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
