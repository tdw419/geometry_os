; DESCRIPTION: Renders a purple rectangular region spanning 103 by 14 at (171, 114).
; PLAN: r0=171(x), r1=114(y), r2=103(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 114
LDI r2, 103
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
