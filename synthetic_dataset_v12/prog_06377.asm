; DESCRIPTION: Composite: Renders a magenta box of size 76x60 starting at (111, 83) then Sets a single magenta pixel at (504, 110).
; PLAN: r0=111(x), r1=83(y), r2=76(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=110(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 111
LDI r1, 83
LDI r2, 76
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 110
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
