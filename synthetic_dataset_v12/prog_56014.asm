; DESCRIPTION: Composite: Creates a magenta rectangular region at (457, 73) spanning 43 by 22 pixels then Places a blue dot at position (64, 219).
; PLAN: r0=457(x), r1=73(y), r2=43(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=219(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 457
LDI r1, 73
LDI r2, 43
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 219
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
