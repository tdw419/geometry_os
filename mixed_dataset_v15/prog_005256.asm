; DESCRIPTION: Renders a magenta box of size 16x69 starting at (265, 181).
; PLAN: r0=265(x), r1=181(y), r2=16(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 181
LDI r2, 16
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
