; DESCRIPTION: Renders a magenta box of size 58x50 starting at (122, 119).
; PLAN: r0=122(x), r1=119(y), r2=58(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 119
LDI r2, 58
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
