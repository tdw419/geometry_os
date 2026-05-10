; DESCRIPTION: Renders a purple box of size 116x12 starting at (17, 171).
; PLAN: r0=17(x), r1=171(y), r2=116(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 171
LDI r2, 116
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
