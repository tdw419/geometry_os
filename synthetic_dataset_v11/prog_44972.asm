; DESCRIPTION: Renders a purple box of size 105x116 starting at (95, 97).
; PLAN: r0=95(x), r1=97(y), r2=105(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 97
LDI r2, 105
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
