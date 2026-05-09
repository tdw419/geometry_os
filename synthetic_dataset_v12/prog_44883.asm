; DESCRIPTION: Renders a purple box of size 13x43 starting at (406, 184).
; PLAN: r0=406(x), r1=184(y), r2=13(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 184
LDI r2, 13
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
