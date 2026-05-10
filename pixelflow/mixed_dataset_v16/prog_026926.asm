; DESCRIPTION: Renders a purple box of size 85x85 starting at (366, 89).
; PLAN: r0=366(x), r1=89(y), r2=85(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 89
LDI r2, 85
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
