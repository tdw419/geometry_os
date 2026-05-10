; DESCRIPTION: Renders a purple rectangular region spanning 92 by 83 at (241, 109).
; PLAN: r0=24(x), r1=109(y), r2=92(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 109
LDI r2, 92
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
