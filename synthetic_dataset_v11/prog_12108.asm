; DESCRIPTION: Renders a purple box of size 103x43 starting at (17, 29).
; PLAN: r0=17(x), r1=29(y), r2=103(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 29
LDI r2, 103
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
