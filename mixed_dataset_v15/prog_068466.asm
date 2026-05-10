; DESCRIPTION: Renders a purple rectangular region spanning 103 by 74 at (355, 95).
; PLAN: r0=355(x), r1=95(y), r2=103(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 95
LDI r2, 103
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
