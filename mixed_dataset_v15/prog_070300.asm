; DESCRIPTION: Composite: Renders a purple box of size 37x62 starting at (458, 72) then Sets a single green pixel at (102, 29).
; PLAN: r0=458(x), r1=72(y), r2=37(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x), r6=29(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 72
LDI r2, 37
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 29
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
