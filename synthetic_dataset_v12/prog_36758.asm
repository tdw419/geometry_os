; DESCRIPTION: Renders a purple box of size 105x40 starting at (122, 210).
; PLAN: r0=122(x), r1=210(y), r2=105(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 210
LDI r2, 105
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
