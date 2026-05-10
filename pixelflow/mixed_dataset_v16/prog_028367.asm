; DESCRIPTION: Renders a purple rectangular region spanning 17 by 116 at (126, 33).
; PLAN: r0=126(x), r1=33(y), r2=17(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 33
LDI r2, 17
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
