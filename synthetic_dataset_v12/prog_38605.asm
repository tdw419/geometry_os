; DESCRIPTION: Composite: Creates a orange rectangular region at (108, 88) spanning 82 by 40 pixels then Places a magenta dot at position (506, 121).
; PLAN: r0=108(x), r1=88(y), r2=82(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=506(x), r6=121(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 88
LDI r2, 82
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 506
LDI r6, 121
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
