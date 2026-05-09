; DESCRIPTION: Renders a purple box of size 13x69 starting at (387, 126).
; PLAN: r0=387(x), r1=126(y), r2=13(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 126
LDI r2, 13
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
