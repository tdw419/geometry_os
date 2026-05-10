; DESCRIPTION: Composite: Renders a magenta box of size 74x86 starting at (23, 116) then Sets a single blue pixel at (268, 254).
; PLAN: r0=23(x), r1=116(y), r2=74(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=254(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 23
LDI r1, 116
LDI r2, 74
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 254
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
