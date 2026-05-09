; DESCRIPTION: Renders a blue box of size 57x74 starting at (212, 114).
; PLAN: r0=212(x), r1=114(y), r2=57(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 114
LDI r2, 57
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
