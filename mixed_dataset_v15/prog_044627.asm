; DESCRIPTION: Composite: Renders a green box of size 77x115 starting at (143, 52) then Sets a single yellow pixel at (69, 172).
; PLAN: r0=143(x), r1=52(y), r2=77(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 143
LDI r1, 52
LDI r2, 77
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
