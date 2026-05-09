; DESCRIPTION: Renders a magenta box of size 74x96 starting at (401, 62).
; PLAN: r0=401(x), r1=62(y), r2=74(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 62
LDI r2, 74
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
