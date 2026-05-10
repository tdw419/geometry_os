; DESCRIPTION: Places a red 84x50 rectangle at position (13, 67).
; PLAN: r0=13(x), r1=67(y), r2=84(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 67
LDI r2, 84
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
