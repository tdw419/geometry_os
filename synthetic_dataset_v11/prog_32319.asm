; DESCRIPTION: Renders a magenta box of size 69x52 starting at (8, 76).
; PLAN: r0=8(x), r1=76(y), r2=69(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 76
LDI r2, 69
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
