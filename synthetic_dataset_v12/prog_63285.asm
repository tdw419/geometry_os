; DESCRIPTION: Renders a purple box of size 70x114 starting at (361, 27).
; PLAN: r0=361(x), r1=27(y), r2=70(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 27
LDI r2, 70
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
