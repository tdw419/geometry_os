; DESCRIPTION: Renders a purple box of size 34x85 starting at (312, 109).
; PLAN: r0=312(x), r1=109(y), r2=34(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 109
LDI r2, 34
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
