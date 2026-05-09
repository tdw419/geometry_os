; DESCRIPTION: Renders a magenta box of size 62x39 starting at (55, 180).
; PLAN: r0=55(x), r1=180(y), r2=62(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 180
LDI r2, 62
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
