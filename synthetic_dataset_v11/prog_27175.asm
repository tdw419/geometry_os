; DESCRIPTION: Renders a magenta box of size 90x43 starting at (90, 38).
; PLAN: r0=90(x), r1=38(y), r2=90(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 38
LDI r2, 90
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
