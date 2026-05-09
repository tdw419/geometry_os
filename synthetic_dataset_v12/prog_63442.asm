; DESCRIPTION: Renders a magenta box of size 67x87 starting at (105, 89).
; PLAN: r0=105(x), r1=89(y), r2=67(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 89
LDI r2, 67
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
