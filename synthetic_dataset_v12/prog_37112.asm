; DESCRIPTION: Renders a blue box of size 96x61 starting at (71, 2).
; PLAN: r0=71(x), r1=2(y), r2=96(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 2
LDI r2, 96
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
