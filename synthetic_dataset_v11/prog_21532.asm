; DESCRIPTION: Renders a blue box of size 61x67 starting at (20, 116).
; PLAN: r0=20(x), r1=116(y), r2=61(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 116
LDI r2, 61
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
