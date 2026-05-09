; DESCRIPTION: Renders a purple box of size 43x43 starting at (38, 14).
; PLAN: r0=38(x), r1=14(y), r2=43(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 14
LDI r2, 43
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
