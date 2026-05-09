; DESCRIPTION: Composite: Renders a yellow box of size 37x112 starting at (251, 15) then Places a white dot at position (66, 228).
; PLAN: r0=251(x), r1=15(y), r2=37(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=228(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 251
LDI r1, 15
LDI r2, 37
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 228
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
