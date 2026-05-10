; DESCRIPTION: Renders a orange rectangular region spanning 81 by 78 at (92, 157).
; PLAN: r0=92(x), r1=157(y), r2=81(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 157
LDI r2, 81
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
