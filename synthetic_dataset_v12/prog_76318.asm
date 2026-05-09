; DESCRIPTION: Renders a purple box of size 71x64 starting at (134, 49).
; PLAN: r0=134(x), r1=49(y), r2=71(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 49
LDI r2, 71
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
