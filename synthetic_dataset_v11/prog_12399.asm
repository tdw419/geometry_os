; DESCRIPTION: Renders a magenta box of size 55x88 starting at (151, 95).
; PLAN: r0=151(x), r1=95(y), r2=55(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 95
LDI r2, 55
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
