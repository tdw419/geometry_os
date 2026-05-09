; DESCRIPTION: Renders a magenta box of size 38x12 starting at (53, 30).
; PLAN: r0=53(x), r1=30(y), r2=38(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 30
LDI r2, 38
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
