; DESCRIPTION: Renders a magenta box of size 30x49 starting at (414, 104).
; PLAN: r0=414(x), r1=104(y), r2=30(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 104
LDI r2, 30
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
