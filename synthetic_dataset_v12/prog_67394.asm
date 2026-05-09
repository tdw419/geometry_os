; DESCRIPTION: Renders a magenta box of size 61x62 starting at (68, 137).
; PLAN: r0=68(x), r1=137(y), r2=61(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 137
LDI r2, 61
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
