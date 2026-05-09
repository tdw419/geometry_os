; DESCRIPTION: Renders a purple box of size 45x29 starting at (210, 5).
; PLAN: r0=210(x), r1=5(y), r2=45(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 5
LDI r2, 45
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
