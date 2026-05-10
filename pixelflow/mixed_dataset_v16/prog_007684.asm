; DESCRIPTION: Renders a magenta box of size 81x95 starting at (340, 153).
; PLAN: r0=340(x), r1=153(y), r2=81(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 153
LDI r2, 81
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
