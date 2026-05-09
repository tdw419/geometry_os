; DESCRIPTION: Renders a magenta box of size 89x38 starting at (48, 88).
; PLAN: r0=48(x), r1=88(y), r2=89(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 88
LDI r2, 89
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
