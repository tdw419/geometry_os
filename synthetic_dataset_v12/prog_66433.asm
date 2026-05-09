; DESCRIPTION: Renders a magenta box of size 88x120 starting at (142, 19).
; PLAN: r0=142(x), r1=19(y), r2=88(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 19
LDI r2, 88
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
