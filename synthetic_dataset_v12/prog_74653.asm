; DESCRIPTION: Renders a magenta box of size 38x88 starting at (332, 27).
; PLAN: r0=332(x), r1=27(y), r2=38(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 27
LDI r2, 38
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
