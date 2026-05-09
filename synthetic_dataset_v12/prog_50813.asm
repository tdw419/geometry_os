; DESCRIPTION: Renders a magenta box of size 88x39 starting at (376, 12).
; PLAN: r0=376(x), r1=12(y), r2=88(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 12
LDI r2, 88
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
