; DESCRIPTION: Renders a magenta box of size 106x18 starting at (402, 67).
; PLAN: r0=402(x), r1=67(y), r2=106(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 67
LDI r2, 106
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
