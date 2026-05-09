; DESCRIPTION: Renders a purple box of size 10x62 starting at (405, 158).
; PLAN: r0=405(x), r1=158(y), r2=10(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 158
LDI r2, 10
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
