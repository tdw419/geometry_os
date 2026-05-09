; DESCRIPTION: Renders a purple box of size 101x39 starting at (21, 43).
; PLAN: r0=21(x), r1=43(y), r2=101(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 43
LDI r2, 101
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
