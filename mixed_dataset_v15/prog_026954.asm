; DESCRIPTION: Renders a red rectangular region spanning 80 by 100 at (92, 112).
; PLAN: r0=92(x), r1=112(y), r2=80(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 112
LDI r2, 80
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
