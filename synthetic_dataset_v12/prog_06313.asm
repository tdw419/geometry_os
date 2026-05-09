; DESCRIPTION: Renders a purple box of size 62x45 starting at (312, 95).
; PLAN: r0=312(x), r1=95(y), r2=62(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 95
LDI r2, 62
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
