; DESCRIPTION: Renders a magenta box of size 73x96 starting at (19, 144).
; PLAN: r0=19(x), r1=144(y), r2=73(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 144
LDI r2, 73
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
