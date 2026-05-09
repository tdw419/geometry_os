; DESCRIPTION: Renders a purple box of size 20x59 starting at (121, 126).
; PLAN: r0=121(x), r1=126(y), r2=20(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 126
LDI r2, 20
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
