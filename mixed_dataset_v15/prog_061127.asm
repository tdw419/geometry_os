; DESCRIPTION: Renders a magenta box of size 81x66 starting at (288, 60).
; PLAN: r0=288(x), r1=60(y), r2=81(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 60
LDI r2, 81
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
