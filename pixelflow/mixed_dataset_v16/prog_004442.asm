; DESCRIPTION: Places a magenta 106x67 rectangle at position (112, 84).
; PLAN: r0=112(x), r1=84(y), r2=106(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 84
LDI r2, 106
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
