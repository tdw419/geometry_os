; DESCRIPTION: Composite: Creates a magenta rectangular region at (160, 17) spanning 18 by 92 pixels then Places a magenta dot at position (214, 238).
; PLAN: r0=160(x), r1=17(y), r2=18(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=238(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 160
LDI r1, 17
LDI r2, 18
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 238
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
