; DESCRIPTION: Composite: Renders a yellow box of size 81x38 starting at (107, 205) then Sets a single purple pixel at (174, 125).
; PLAN: r0=107(x), r1=205(y), r2=81(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x), r6=125(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 205
LDI r2, 81
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 125
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
