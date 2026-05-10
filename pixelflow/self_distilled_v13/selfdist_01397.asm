; DESCRIPTION: Places a magenta 67x99 box at position (126, 68).
; PLAN: r0=126(x), r1=68(y), r2=67(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 68
LDI r2, 67
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
