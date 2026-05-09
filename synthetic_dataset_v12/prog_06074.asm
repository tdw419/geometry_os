; DESCRIPTION: Places a magenta 67x71 rectangle at position (280, 34).
; PLAN: r0=280(x), r1=34(y), r2=67(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 34
LDI r2, 67
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
