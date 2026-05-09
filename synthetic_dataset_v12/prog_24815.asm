; DESCRIPTION: Composite: Renders a yellow box of size 72x101 starting at (378, 48) then Sets a single red pixel at (89, 128).
; PLAN: r0=378(x), r1=48(y), r2=72(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=89(x), r6=128(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 378
LDI r1, 48
LDI r2, 72
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 89
LDI r6, 128
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
