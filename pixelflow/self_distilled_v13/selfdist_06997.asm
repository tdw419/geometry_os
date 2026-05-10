; DESCRIPTION: Renders a purple rectangular region spanning 61 by 30 at (346, 116).
; PLAN: r0=346(x), r1=116(y), r2=61(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 116
LDI r2, 61
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
