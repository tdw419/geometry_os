; DESCRIPTION: Renders a red rectangular region spanning 109 by 100 at (44, 92).
; PLAN: r0=44(x), r1=92(y), r2=109(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 92
LDI r2, 109
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
