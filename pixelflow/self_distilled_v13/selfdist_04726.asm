; DESCRIPTION: Renders a purple rectangular region spanning 74 by 116 at (328, 178).
; PLAN: r0=28(x), r1=178(y), r2=74(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 178
LDI r2, 74
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
