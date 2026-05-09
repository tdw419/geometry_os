; DESCRIPTION: Composite: Renders a orange box of size 63x114 starting at (426, 25) then Sets a single orange pixel at (167, 6).
; PLAN: r0=426(x), r1=25(y), r2=63(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=6(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 426
LDI r1, 25
LDI r2, 63
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 6
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
