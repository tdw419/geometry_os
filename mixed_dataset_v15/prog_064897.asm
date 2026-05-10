; DESCRIPTION: Renders a purple rectangular region spanning 30 by 105 at (252, 117).
; PLAN: r0=252(x), r1=117(y), r2=30(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 117
LDI r2, 30
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
