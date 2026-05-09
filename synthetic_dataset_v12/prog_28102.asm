; DESCRIPTION: Renders a magenta box of size 89x67 starting at (423, 113).
; PLAN: r0=423(x), r1=113(y), r2=89(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 113
LDI r2, 89
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
