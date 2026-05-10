; DESCRIPTION: Renders a magenta box of size 19x21 starting at (45, 67).
; PLAN: r0=45(x), r1=67(y), r2=19(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 67
LDI r2, 19
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
