; DESCRIPTION: Places a magenta 13x67 rectangle at position (368, 89).
; PLAN: r0=368(x), r1=89(y), r2=13(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 89
LDI r2, 13
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
