; DESCRIPTION: Renders a magenta box of size 52x99 starting at (297, 53).
; PLAN: r0=297(x), r1=53(y), r2=52(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 53
LDI r2, 52
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
