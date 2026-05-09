; DESCRIPTION: Composite: Creates a orange circular shape at (138, 79) with radius 17 then Renders a purple box of size 51x66 starting at (212, 182).
; PLAN: r0=138(x), r1=79(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=182(y), r7=51(width), r8=66(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 79
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 182
LDI r7, 51
LDI r8, 66
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
