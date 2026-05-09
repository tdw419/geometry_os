; DESCRIPTION: Composite: Creates a purple rectangular region at (307, 166) spanning 19 by 41 pixels then Draws a orange circle centered at (441, 64) with radius 51.
; PLAN: r0=307(x), r1=166(y), r2=19(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=441(x), r6=64(y), r7=51(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 307
LDI r1, 166
LDI r2, 19
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 64
LDI r7, 51
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
