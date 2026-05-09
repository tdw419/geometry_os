; DESCRIPTION: Renders a purple box of size 26x45 starting at (60, 8).
; PLAN: r0=60(x), r1=8(y), r2=26(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 8
LDI r2, 26
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
