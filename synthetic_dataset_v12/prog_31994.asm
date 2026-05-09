; DESCRIPTION: Renders a magenta box of size 120x62 starting at (359, 177).
; PLAN: r0=359(x), r1=177(y), r2=120(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 177
LDI r2, 120
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
