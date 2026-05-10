; DESCRIPTION: Renders a purple box of size 21x37 starting at (299, 72).
; PLAN: r0=299(x), r1=72(y), r2=21(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 72
LDI r2, 21
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
