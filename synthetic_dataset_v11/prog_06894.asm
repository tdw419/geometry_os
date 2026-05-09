; DESCRIPTION: Renders a magenta box of size 111x62 starting at (119, 183).
; PLAN: r0=119(x), r1=183(y), r2=111(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 183
LDI r2, 111
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
