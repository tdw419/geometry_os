; DESCRIPTION: Renders a magenta box of size 116x62 starting at (50, 149).
; PLAN: r0=50(x), r1=149(y), r2=116(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 149
LDI r2, 116
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
