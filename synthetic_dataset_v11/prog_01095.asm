; DESCRIPTION: Renders a blue box of size 74x48 starting at (68, 158).
; PLAN: r0=68(x), r1=158(y), r2=74(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 158
LDI r2, 74
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
