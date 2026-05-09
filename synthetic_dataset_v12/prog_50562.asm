; DESCRIPTION: Renders a purple box of size 47x73 starting at (30, 72).
; PLAN: r0=30(x), r1=72(y), r2=47(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 72
LDI r2, 47
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
