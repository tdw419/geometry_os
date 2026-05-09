; DESCRIPTION: Renders a purple box of size 29x66 starting at (151, 113).
; PLAN: r0=151(x), r1=113(y), r2=29(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 113
LDI r2, 29
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
