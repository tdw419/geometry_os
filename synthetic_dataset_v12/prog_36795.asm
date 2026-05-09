; DESCRIPTION: Renders a purple box of size 108x81 starting at (24, 7).
; PLAN: r0=24(x), r1=7(y), r2=108(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 7
LDI r2, 108
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
