; DESCRIPTION: Renders a blue box of size 93x116 starting at (19, 63).
; PLAN: r0=19(x), r1=63(y), r2=93(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 63
LDI r2, 93
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
