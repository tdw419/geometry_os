; DESCRIPTION: Composite: Renders a green box of size 94x23 starting at (306, 4) then Sets a single blue pixel at (255, 211).
; PLAN: r0=306(x), r1=4(y), r2=94(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=255(x), r6=211(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 306
LDI r1, 4
LDI r2, 94
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 211
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
