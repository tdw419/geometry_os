; DESCRIPTION: Composite: Renders a white box of size 109x80 starting at (354, 60) then Sets a single purple pixel at (201, 21).
; PLAN: r0=354(x), r1=60(y), r2=109(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=21(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 354
LDI r1, 60
LDI r2, 109
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 21
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
