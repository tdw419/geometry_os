; DESCRIPTION: Renders a magenta box of size 67x66 starting at (111, 154).
; PLAN: r0=111(x), r1=154(y), r2=67(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 154
LDI r2, 67
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
