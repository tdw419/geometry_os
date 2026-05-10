; DESCRIPTION: Renders a purple rectangular region spanning 109 by 93 at (203, 173).
; PLAN: r0=203(x), r1=173(y), r2=109(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 173
LDI r2, 109
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
