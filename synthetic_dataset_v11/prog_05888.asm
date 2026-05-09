; DESCRIPTION: Renders a blue box of size 93x26 starting at (61, 6).
; PLAN: r0=61(x), r1=6(y), r2=93(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 6
LDI r2, 93
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
