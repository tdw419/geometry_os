; DESCRIPTION: Renders a magenta box of size 73x88 starting at (396, 29).
; PLAN: r0=396(x), r1=29(y), r2=73(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 29
LDI r2, 73
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
