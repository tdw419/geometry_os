; DESCRIPTION: Renders a yellow rectangular region spanning 102 by 72 at (92, 73).
; PLAN: r0=92(x), r1=73(y), r2=102(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 73
LDI r2, 102
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
