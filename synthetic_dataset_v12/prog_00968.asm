; DESCRIPTION: Renders a magenta box of size 47x92 starting at (159, 67).
; PLAN: r0=159(x), r1=67(y), r2=47(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 67
LDI r2, 47
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
