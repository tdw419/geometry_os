; DESCRIPTION: Composite: Renders a white box of size 85x15 starting at (91, 103) then Sets a single blue pixel at (157, 214).
; PLAN: r0=91(x), r1=103(y), r2=85(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=214(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 103
LDI r2, 85
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 214
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
