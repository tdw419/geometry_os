; DESCRIPTION: Renders a magenta box of size 10x49 starting at (286, 104).
; PLAN: r0=286(x), r1=104(y), r2=10(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 104
LDI r2, 10
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
