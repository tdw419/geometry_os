; DESCRIPTION: Renders a purple box of size 74x87 starting at (1, 45).
; PLAN: r0=1(x), r1=45(y), r2=74(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 45
LDI r2, 74
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
