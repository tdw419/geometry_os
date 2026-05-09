; DESCRIPTION: Renders a purple box of size 108x65 starting at (291, 36).
; PLAN: r0=291(x), r1=36(y), r2=108(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 36
LDI r2, 108
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
