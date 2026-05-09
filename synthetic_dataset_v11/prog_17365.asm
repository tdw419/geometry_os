; DESCRIPTION: Places a magenta 48x67 rectangle at position (203, 12).
; PLAN: r0=203(x), r1=12(y), r2=48(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 12
LDI r2, 48
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
