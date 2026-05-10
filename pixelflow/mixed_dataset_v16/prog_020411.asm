; DESCRIPTION: Composite: Renders a green box of size 71x111 starting at (406, 145) then Sets a single green pixel at (319, 158).
; PLAN: r0=406(x), r1=145(y), r2=71(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=319(x), r6=158(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 406
LDI r1, 145
LDI r2, 71
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 158
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
