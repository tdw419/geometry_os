; DESCRIPTION: Renders a magenta box of size 67x53 starting at (128, 72).
; PLAN: r0=128(x), r1=72(y), r2=67(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 72
LDI r2, 67
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
