; DESCRIPTION: Renders a purple box of size 108x20 starting at (30, 56).
; PLAN: r0=30(x), r1=56(y), r2=108(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 56
LDI r2, 108
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
