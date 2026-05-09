; DESCRIPTION: Composite: Renders a black box of size 90x100 starting at (83, 63) then Sets a single green pixel at (397, 168).
; PLAN: r0=83(x), r1=63(y), r2=90(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=168(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 63
LDI r2, 90
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 168
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
