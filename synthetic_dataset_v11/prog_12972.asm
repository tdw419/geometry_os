; DESCRIPTION: Renders a purple box of size 95x81 starting at (10, 25).
; PLAN: r0=10(x), r1=25(y), r2=95(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 25
LDI r2, 95
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
