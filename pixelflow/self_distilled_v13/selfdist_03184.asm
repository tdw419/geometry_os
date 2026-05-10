; DESCRIPTION: Renders a red rectangular region spanning 85 by 92 at (90, 181).
; PLAN: r0=90(x), r1=181(y), r2=85(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 181
LDI r2, 85
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
