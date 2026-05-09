; DESCRIPTION: Renders a blue box of size 109x81 starting at (181, 134).
; PLAN: r0=181(x), r1=134(y), r2=109(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 134
LDI r2, 109
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
