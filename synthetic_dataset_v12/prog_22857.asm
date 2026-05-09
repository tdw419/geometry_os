; DESCRIPTION: Composite: Renders a red box of size 12x56 starting at (318, 48) then Sets a single blue pixel at (362, 163).
; PLAN: r0=318(x), r1=48(y), r2=12(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=163(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 318
LDI r1, 48
LDI r2, 12
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 163
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
