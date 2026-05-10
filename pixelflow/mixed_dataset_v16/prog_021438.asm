; DESCRIPTION: Composite: Renders a magenta box of size 106x71 starting at (381, 75) then Sets a single red pixel at (87, 200).
; PLAN: r0=381(x), r1=75(y), r2=106(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=200(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 381
LDI r1, 75
LDI r2, 106
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 200
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
