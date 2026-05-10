; DESCRIPTION: Renders a orange rectangular region spanning 96 by 66 at (112, 144).
; PLAN: r0=112(x), r1=144(y), r2=96(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 144
LDI r2, 96
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
