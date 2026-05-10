; DESCRIPTION: Renders a purple rectangular region spanning 10 by 116 at (1, 82).
; PLAN: r0=1(x), r1=82(y), r2=10(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 82
LDI r2, 10
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
