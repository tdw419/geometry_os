; DESCRIPTION: Renders a magenta box of size 68x88 starting at (4, 98).
; PLAN: r0=4(x), r1=98(y), r2=68(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 98
LDI r2, 68
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
