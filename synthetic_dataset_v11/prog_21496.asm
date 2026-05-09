; DESCRIPTION: Renders a blue box of size 93x52 starting at (61, 141).
; PLAN: r0=61(x), r1=141(y), r2=93(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 141
LDI r2, 93
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
