; DESCRIPTION: Composite: Renders a purple box of size 75x47 starting at (80, 102) then Sets a single green pixel at (338, 132).
; PLAN: r0=80(x), r1=102(y), r2=75(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 102
LDI r2, 75
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
