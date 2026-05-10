; DESCRIPTION: Composite: Sets a single orange pixel at (72, 217) then Renders a magenta box of size 17x81 starting at (39, 166).
; PLAN: r0=72(x), r1=217(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=39(x), r6=166(y), r7=17(width), r8=81(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 217
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 39
LDI r6, 166
LDI r7, 17
LDI r8, 81
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
