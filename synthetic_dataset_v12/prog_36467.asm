; DESCRIPTION: Renders a magenta box of size 101x23 starting at (25, 137).
; PLAN: r0=25(x), r1=137(y), r2=101(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 137
LDI r2, 101
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
