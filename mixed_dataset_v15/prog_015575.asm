; DESCRIPTION: Composite: Renders a magenta box of size 110x101 starting at (293, 137) then Places a magenta dot at position (421, 222).
; PLAN: r0=293(x), r1=137(y), r2=110(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=222(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 137
LDI r2, 110
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 222
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
