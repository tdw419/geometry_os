; DESCRIPTION: Renders a magenta box of size 14x49 starting at (47, 134).
; PLAN: r0=47(x), r1=134(y), r2=14(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 134
LDI r2, 14
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
