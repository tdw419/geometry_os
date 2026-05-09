; DESCRIPTION: Renders a magenta box of size 67x33 starting at (56, 22).
; PLAN: r0=56(x), r1=22(y), r2=67(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 22
LDI r2, 67
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
