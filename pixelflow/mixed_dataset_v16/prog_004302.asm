; DESCRIPTION: Composite: Renders a white box of size 38x102 starting at (363, 32) then Sets a single green pixel at (28, 108).
; PLAN: r0=363(x), r1=32(y), r2=38(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=28(x), r6=108(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 363
LDI r1, 32
LDI r2, 38
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 28
LDI r6, 108
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
