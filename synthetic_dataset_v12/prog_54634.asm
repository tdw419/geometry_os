; DESCRIPTION: Renders a purple box of size 116x56 starting at (270, 40).
; PLAN: r0=270(x), r1=40(y), r2=116(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 40
LDI r2, 116
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
