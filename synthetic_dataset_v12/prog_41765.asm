; DESCRIPTION: Renders a purple box of size 116x107 starting at (117, 85).
; PLAN: r0=117(x), r1=85(y), r2=116(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 85
LDI r2, 116
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
