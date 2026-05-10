; DESCRIPTION: Places a magenta 71x67 rectangle at position (18, 84).
; PLAN: r0=18(x), r1=84(y), r2=71(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 84
LDI r2, 71
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
