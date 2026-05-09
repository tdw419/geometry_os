; DESCRIPTION: Places a magenta 91x113 rectangle at position (67, 77).
; PLAN: r0=67(x), r1=77(y), r2=91(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 77
LDI r2, 91
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
