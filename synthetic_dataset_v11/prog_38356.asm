; DESCRIPTION: Renders a blue box of size 61x81 starting at (2, 109).
; PLAN: r0=2(x), r1=109(y), r2=61(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 109
LDI r2, 61
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
